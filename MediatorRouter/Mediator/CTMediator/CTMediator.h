//
//  CTMediator.h
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/23.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kCTMediatorParamsKeySwiftTargetModuleName;

@interface CTMediator : NSObject

+ (instancetype)sharedInstance;

/**
 * 远程App调用入口
 * @param url url接口
 * @param completion block回调
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

/**
 * 本地组件调用入口
 * @param targetName 目标名字
 * @param actionName 方法名字
 * @param params 参数字典
 * @param shouldCacheTarget 是否缓存目标
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

/**
 * 释放已缓存的目标 通过目标名字
 * @param targetName 目标名字
 */
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end

NS_ASSUME_NONNULL_END
