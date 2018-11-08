
//
//  Target_MediatorCategoryService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorCategoryViewController.h"

#import "MediatorCategoryViewController.h"

@interface Target_MediatorCategoryViewController ()

@end

@implementation Target_MediatorCategoryViewController

- (UIViewController *)Action_MediatorCategoryViewController:(NSDictionary *)param;
{
    
    MediatorCategoryViewController * vc = [[MediatorCategoryViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    return vc;
    
}

@end
