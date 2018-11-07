//
//  Target_ModuleB.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/26.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "Target_ModuleB.h"
#import "BViewController.h"

typedef void(^CallbackType)(NSString *result);

@implementation Target_ModuleB

- (UIViewController *)Action_Category_ViewController:(NSDictionary *)params {
//    typedef void (^CallbackType)(NSString *);
    CallbackType callback = params[@"callback"];
    if (callback) {
        callback(@"success");
    }
    BViewController *viewController = [[BViewController alloc] init];
    return viewController;
}

@end
