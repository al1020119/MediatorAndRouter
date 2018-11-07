//
//  RouterHomeViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "RouterHomeViewController.h"

#import "MGJRouter.h"

@interface RouterHomeViewController ()

@end

@implementation RouterHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MGJRouter openURL:@"mgj://app/godetail" withUserInfo:@{
                                                            @"title" : @"详情",
                                                            @"navigationVC" : self.navigationController,
                                                            @"name" : @"传值"
                                                            } completion:nil];
}

@end
