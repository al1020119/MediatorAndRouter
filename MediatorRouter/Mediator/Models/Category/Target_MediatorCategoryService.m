
//
//  Target_MediatorCategoryService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorCategoryService.h"

#import "MediatorCategoryViewController.h"

@interface Target_MediatorCategoryService ()

@end

@implementation Target_MediatorCategoryService

- (UIViewController *)Action_CategoryViewController:(NSDictionary *)param;
{
    
    MediatorCategoryViewController * vc = [[MediatorCategoryViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    return vc;
    
}

@end
