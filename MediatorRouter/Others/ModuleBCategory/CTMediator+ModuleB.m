//
//  CTMediator+ModuleB.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/26.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "CTMediator+ModuleB.h"

@implementation CTMediator (ModuleB)

- (UIViewController *)ModuleB_Category_Objc_ViewControllerWithCallback:(Callback)callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"callback"] = callback;
    return [self performTarget:@"ModuleB" action:@"Category_ViewController" params:params shouldCacheTarget:NO];
}

@end
