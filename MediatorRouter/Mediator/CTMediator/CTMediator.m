//
//  CTMediator.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/23.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NSString * const kCTMediatorParamsKeySwiftTargetModuleName = @"kCTMediatorParamsKeySwiftTargetModuleName";

@interface CTMediator ()

@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end

@implementation CTMediator

#pragma mark - public methods
+ (instancetype)sharedInstance {
    static CTMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CTMediator alloc] init];
    });
    return mediator;
}

/**
 * 远程App调用入口
 * @param url url接口
 * @param completion block回调
 */
//scheme://[target]/[action]?[params]
//aaa://targetA/actionB?id=1234
- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块，这里的做法足以应对绝大多数场景。如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
    id result = [self performTarget:url.host action:actionName params:params shouldCacheTarget:NO];
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        } else {
            completion(nil);
        }
    }
    return result;
}

/**
 * 本地组件调用入口
 * @param targetName 目标名字
 * @param actionName 方法名字
 * @param params 参数字典
 * @param shouldCacheTarget 是否缓存目标
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget {
    // 1.通过targetName 获得target实例
    NSString *targetClassString = nil;
    // 如果当前模块语言为Swift语言 那么这里会取到内容
    NSString *swiftModuleName = params[kCTMediatorParamsKeySwiftTargetModuleName];
    if (swiftModuleName.length > 0) { // 当前模块语言为Swift语言
        targetClassString = [NSString stringWithFormat:@"%@.Target_%@", swiftModuleName, targetName];
    } else {
        targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    }
    NSLog(@"tt_targetClassString:%@", targetClassString);
    NSObject *target = self.cachedTarget[targetClassString]; // 先从缓存中获取target类字符串对应的target对象
    if (target == nil) {
        Class targetClass = NSClassFromString(targetClassString); // target类的字符串形式转换成target类
        target = [[targetClass alloc] init]; // 创建target类型的对象
    }
    
    // 2.通过actionName 获得action选择子
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:", actionName];
    NSLog(@"tt_actionString:%@", actionString);
    SEL action = NSSelectorFromString(actionString);
    
    /*
     注意：
     目标实例和方法选择子都是通过casa预先制定好的规范(根据事先规定 比如拼接字符串格式 从而命名文件或方法等)而获取 之后运用到个人项目时可以按照公司制定规范
     */
    
    // 3.调用到目标业务提供的逻辑
    // 3.1 首先要确认是否有可以响应的target
    if (target == nil) { // target对象为nil
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。
        // 实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的。
        [self NoTargetActionResponseWithTargetString:targetClassString selectorString:actionString originParams:params];
        return nil;
    }
    
    // 是否需要缓存target
    if (shouldCacheTarget) {
        self.cachedTarget[targetClassString] = target;
    }
    
    // 3.2 target是否响应了action方法
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target params:params];
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
            return [self safePerformAction:action target:target params:params];
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。
            // 实际开发过程中，可以用前面提到的固定的target顶上的。
            [self NoTargetActionResponseWithTargetString:targetClassString selectorString:actionString originParams:params];
            [self.cachedTarget removeObjectForKey:targetClassString]; // 移除缓存的target
            return nil;
        }
    }
}

/**
 * 释放已缓存的目标 通过目标名字
 * @param targetName 目标名字
 */
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName {
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    [self.cachedTarget removeObjectForKey:targetClassString];
}

#pragma mark - private methods
/**
 * 没有响应的target或action的默认处理方式 - 可根据项目的实际情况来进行处理
 * @param targetString 目标类的字符串
 * @param selectorString 选择子的字符串描述
 * @param originParams 参数字典
 */
- (void)NoTargetActionResponseWithTargetString:(NSString *)targetString selectorString:(NSString *)selectorString originParams:(NSDictionary *)originParams {
    // 创建默认的action选择子
    SEL action = NSSelectorFromString(@"Action_response:");
    // 初始化默认的target
    NSObject *target = [[NSClassFromString(@"Target_NoTargetAction") alloc] init];
    // params保存待调用的入口信息
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"targetString"] = targetString;
    params[@"selectorString"] = selectorString;
    params[@"originParams"] = originParams;
    
    [self safePerformAction:action target:target params:params];
}

/**
 * 组件的调用
 * @param action 选择子
 * @param target 目标对象
 * @param params 参数字典
 */
- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params {
    // NSMethodSignature和NSInvocation是Foundation框架为我们提供的一种调用方法或者调用block的方式。
    // target对象调用action方法
    // 1.获取方法签名
    NSMethodSignature *methodSig = [target methodSignatureForSelector:action];
    if (methodSig == nil) return nil;
    
    // 2.获得方法的返回值类型
    const char *retType = [methodSig methodReturnType];
    
    // 3.针对不同的返回类型做处理
    if (strcmp(retType, @encode(void)) == 0) { // 如果返回类型为void 即没有返回值
        // 3.1 获取方法签名对应的invocation
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        // 3.2 设置消息接受者
        [invocation setTarget:target]; // 等价于[invocation setArgument:(__bridge void * _Nonnull)(target) atIndex:0];
        // 3.3 设置要执行的selector
        [invocation setSelector:action]; // 等价于[invocation setArgument:action atIndex:1];
        // 3.4 设置参数
        [invocation setArgument:&params atIndex:2];
        // 3.5 开始执行
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) { // 如果返回类型为NSInteger
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation setArgument:&params atIndex:2];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result); // 3.6 返回执行结果
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) { // 如果返回类型为BOOL
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation setArgument:&params atIndex:2];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) { // 如果返回类型为CGFloat
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation setArgument:&params atIndex:2];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) { // 如果返回类型为NSUInteger
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation setArgument:&params atIndex:2];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

#pragma mark - getters and setters
- (NSMutableDictionary *)cachedTarget {
    if (_cachedTarget == nil) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}

@end
