
//
//  RouterNextViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "RouterNextViewController.h"

@interface RouterNextViewController ()

@end

@implementation RouterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(blocked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)blocked {
    if (self.btnClickBlock){
        self.btnClickBlock(@"回调");
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
