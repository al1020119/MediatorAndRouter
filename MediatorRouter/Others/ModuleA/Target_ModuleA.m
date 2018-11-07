//
//  Target_ModuleA.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/24.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "Target_ModuleA.h"
#import "AViewController.h"

@implementation Target_ModuleA

- (UIViewController *)Action_Category_ViewController:(NSDictionary *)params {
    typedef void (^CallbackType)(NSString *);
    CallbackType callback = params[@"callback"];
    if (callback) {
        callback(@"success");
    }
    AViewController *viewController = [[AViewController alloc] init];
    return viewController;
}

- (UIViewController *)Action_Extension_ViewController:(NSDictionary *)params {
    typedef void (^CallbackType)(NSString *);
    CallbackType callback = params[@"callback"];
    if (callback) {
        callback(@"success");
    }
    AViewController *viewController = [[AViewController alloc] init];
    return viewController;
}

@end
