//
//  ViewController.m
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/23.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import "SingleViewController.h"

#import "CTMediator.h"
#import "CTMediator+ModuleA.h"
#import "CTMediator+ModuleB.h"

//#import "CTMediator/CTMediator.h"
//#import "ModuleA/CTMediator+ModuleA.h"
//#import "ModuleB/CTMediator+ModuleB.h"

@interface SingleViewController ()

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController");
    
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button1.frame = CGRectMake(100, 100, 100, 50);
    button1.backgroundColor = [UIColor orangeColor];
    [button1 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button1 setTitle:@"进入模块A" forState:(UIControlStateNormal)];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button2.frame = CGRectMake(100, 200, 100, 50);
    button2.backgroundColor = [UIColor orangeColor];
    [button2 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button2 setTitle:@"进入模块B" forState:(UIControlStateNormal)];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button2];
}

- (void)button1Clicked:(UIButton *)button {
    UIViewController *aVC = [[CTMediator sharedInstance] ModuleA_Category_Objc_ViewControllerWithCallback:^(NSString *result) {
        NSLog(@"打开模块A入口VC：%@", result);
    }];
    [self.navigationController pushViewController:aVC animated:YES];
}

- (void)button2Clicked:(UIButton *)button {
    UIViewController *bVC = [[CTMediator sharedInstance] ModuleB_Category_Objc_ViewControllerWithCallback:^(NSString * _Nonnull result) {
        NSLog(@"打开模块B入口VC：%@", result);
    }];
    [self.navigationController pushViewController:bVC animated:YES];
}

@end
