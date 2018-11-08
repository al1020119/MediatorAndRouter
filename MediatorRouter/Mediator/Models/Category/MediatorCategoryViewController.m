//
//  MediatorCategoryViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "MediatorCategoryViewController.h"

#import "CTMediator+NextExtension.h"

@interface MediatorCategoryViewController ()

@end

@implementation MediatorCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BOOL innerCallBack = YES;
    if (innerCallBack) {
        //1，本地调用
        [self.navigationController pushViewController: [[CTMediator sharedInstance] getNextVCWithTitle:@"next" block:^(NSString *name) {
            NSLog(@"---%@",name);
        }] animated:YES];
    } else {
        //2，远程调用
        NSString * urlStr = @"App://MediatorCategoryViewController/MediatorCategoryViewController";
        NSURL * url = [NSURL URLWithString:urlStr];
        UIViewController * vc = [[CTMediator sharedInstance] performActionWithUrl:url completion:NULL];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
