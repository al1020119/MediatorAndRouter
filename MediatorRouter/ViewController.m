//
//  ViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "ViewController.h"

#import "RouterMainViewController.h"
#import "MediatorMainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)MediatorButtonAction:(id)sender {
    MediatorMainViewController * tabVC = [[MediatorMainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabVC];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = nav;
}

- (IBAction)RouterButtonAction:(id)sender {
    RouterMainViewController * tabVC = [[RouterMainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabVC];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = nav;
}


@end
