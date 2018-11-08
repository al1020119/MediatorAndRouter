//
//  Target_MediatorNextService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorNextViewController.h"

#import "MediatorNextViewController.h"

@implementation Target_MediatorNextViewController

- (UIViewController *)Action_MediatorNextViewController:(NSDictionary *)param;
{
    MediatorNextViewController * vc = [[MediatorNextViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    void(^ clicked)(NSString *) = param[@"block"];
    vc.btnClickBlock = clicked;
    return vc;
}

@end
