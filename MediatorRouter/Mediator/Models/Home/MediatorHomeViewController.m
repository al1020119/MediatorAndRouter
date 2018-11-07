
//
//  MediatorHomeViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "MediatorHomeViewController.h"

#import "CTMediator+DetailExtension.h"

@interface MediatorHomeViewController ()

@end

@implementation MediatorHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController: [[CTMediator sharedInstance] getDetailVCWithTitle:@"详情" name:@"传值"] animated:YES];
}

@end
