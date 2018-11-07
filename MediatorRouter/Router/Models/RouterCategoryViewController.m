//
//  RouterCategoryViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "RouterCategoryViewController.h"

#import "MGJRouter.h"

@interface RouterCategoryViewController ()

@end

@implementation RouterCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MGJRouter openURL:@"mgj://app/gonext" withUserInfo:@{
                                                            @"title" : @"Next",
                                                            @"navigationVC" : self.navigationController,
                                                            @"btnClickBlock" : ^(NSString *title) {
                                                                    NSLog(@"---%@",title);
                                                                }
                                                            } completion:nil];
}

@end
