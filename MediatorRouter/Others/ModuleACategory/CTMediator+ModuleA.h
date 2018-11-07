//
//  CTMediator+ModuleA.h
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/24.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Callback)(NSString *result);

@interface CTMediator (ModuleA)

- (UIViewController *)ModuleA_Category_Objc_ViewControllerWithCallback:(Callback)callback;
- (UIViewController *)ModuleA_Category_Swift_ViewControllerWithCallback:(Callback)callback;

@end

NS_ASSUME_NONNULL_END
