//
//  Target_MediatorDetailService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorDetailService.h"

#import "MediatorDetailViewController.h"

@interface Target_MediatorDetailService ()

@end

@implementation Target_MediatorDetailService

- (UIViewController *)Action_MediatorDetailViewController:(NSDictionary *)param;
{
    MediatorDetailViewController * vc = [[MediatorDetailViewController alloc] init];
    vc.name = param[@"name"];
    vc.navigationItem.title = param[@"title"];
    return vc;
}

@end
