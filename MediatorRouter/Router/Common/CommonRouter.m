//
//  CommonRouter.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CommonRouter.h"

#import "MGJRouter.h"

#import "RouterHomeViewController.h"
#import "RouterCategoryViewController.h"
#import "RouterDetailViewController.h"
#import "RouterNextViewController.h"

@implementation CommonRouter

+ (void)load {
    
    [MGJRouter registerURLPattern:@"mgj://app/gethome" toObjectHandler:^id(NSDictionary *routerParameters) {
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        RouterHomeViewController *vc = [[RouterHomeViewController alloc] init];
        vc.title = title;
        vc.navigationItem.title = title;
        return vc;
    }];
    
    [MGJRouter registerURLPattern:@"mgj://app/getcategory" toObjectHandler:^id(NSDictionary *routerParameters) {
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        RouterCategoryViewController *vc = [[RouterCategoryViewController alloc] init];
        vc.title = title;
        vc.navigationItem.title = title;
        return vc;
    }];
    
    [MGJRouter registerURLPattern:@"mgj://app/godetail" toHandler:^(NSDictionary *routerParameters) {
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        UINavigationController *nav = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        NSString *name = routerParameters[MGJRouterParameterUserInfo][@"name"];
        RouterDetailViewController *vc = [[RouterDetailViewController alloc] init];
        vc.title = title;
        vc.navigationItem.title = title;
        vc.name = name;
        vc.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:vc animated:YES];
    }];
    
    [MGJRouter registerURLPattern:@"mgj://app/gonext" toHandler:^(NSDictionary *routerParameters) {
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        UINavigationController *nav = routerParameters[MGJRouterParameterUserInfo][@"navigationVC"];
        void (^clicked)(NSString *) = routerParameters[MGJRouterParameterUserInfo][@"btnClickBlock"];
        RouterNextViewController *vc = [[RouterNextViewController alloc] init];
        vc.btnClickBlock = clicked;
        vc.title = title;
        vc.navigationItem.title = title;
        vc.hidesBottomBarWhenPushed = YES;
        [nav pushViewController:vc animated:YES];
    }];
    
}

@end
