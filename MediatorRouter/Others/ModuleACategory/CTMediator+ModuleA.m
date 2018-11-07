//
//  CTMediator+ModuleA.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/24.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "CTMediator+ModuleA.h"

@implementation CTMediator (ModuleA)

- (UIViewController *)ModuleA_Category_Objc_ViewControllerWithCallback:(Callback)callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    // 发起跨组件调用
    return [self performTarget:@"ModuleA" action:@"Category_ViewController" params:params shouldCacheTarget:NO];
}

- (UIViewController *)ModuleA_Category_Swift_ViewControllerWithCallback:(Callback)callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    params[kCTMediatorParamsKeySwiftTargetModuleName] = @"ModuleA_swift";
    return [self performTarget:@"ModuleA" action:@"Category_ViewController" params:params shouldCacheTarget:NO];
}

@end
