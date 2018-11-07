//
//  Target_MediatorHomeService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorHomeService.h"

#import "MediatorHomeViewController.h"

@interface Target_MediatorHomeService ()

@end

@implementation Target_MediatorHomeService

- (UIViewController *)Action_MediatorHomeViewController:(NSDictionary *)param;
{
    MediatorHomeViewController * vc = [[MediatorHomeViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    return vc;
}

@end
