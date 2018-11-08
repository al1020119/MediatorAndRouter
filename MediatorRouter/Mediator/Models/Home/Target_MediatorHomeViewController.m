//
//  Target_MediatorHomeService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorHomeViewController.h"

#import "MediatorHomeViewController.h"

@interface Target_MediatorHomeViewController ()

@end

@implementation Target_MediatorHomeViewController

- (UIViewController *)Action_MediatorHomeViewController:(NSDictionary *)param;
{
    MediatorHomeViewController * vc = [[MediatorHomeViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    return vc;
}

@end
