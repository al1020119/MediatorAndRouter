//
//  Target_MediatorNextService.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "Target_MediatorNextService.h"

#import "MediatorNextViewController.h"

@implementation Target_MediatorNextService

- (UIViewController *)Action_NextViewController:(NSDictionary *)param;
{
    MediatorNextViewController * vc = [[MediatorNextViewController alloc] init];
    vc.navigationItem.title = param[@"title"];
    void(^ clicked)(NSString *) = param[@"block"];
    vc.btnClickBlock = clicked;
    return vc;
}

@end
