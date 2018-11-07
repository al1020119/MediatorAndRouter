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
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController: [[CTMediator sharedInstance] getNextVCWithTitle:@"next" block:^(NSString *name) {
        NSLog(@"---%@",name);
    }] animated:YES];
}


@end
