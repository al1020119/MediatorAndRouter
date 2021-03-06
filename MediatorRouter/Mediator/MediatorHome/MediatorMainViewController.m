
//
//  MediatorMainViewController.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "MediatorMainViewController.h"
#import "ViewController.h"

#import "CTMediator+HomeExtension.h"
#import "CTMediator+CategoryExtension.h"

@interface MediatorMainViewController ()

@end

@implementation MediatorMainViewController

- (void)leftBarButtonItemAction {
    
    //将我们的storyBoard实例化，“Main”为StoryBoard的名称
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = nav;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemAction)];
    
    [self addChildVC:[[CTMediator sharedInstance] getHomeVCWithTitle:@"首页1"] title:@"首页" image:@"tabbar_platform_normal" selectedImage:@"tabbar_platform_select"];
    [self addChildVC:[[CTMediator sharedInstance] getCategoryVCWithTitle:@"分类1"]  title:@"分类" image:@"tabbar_mine_normal" selectedImage:@"tabbar_mine_select"];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;{
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

@end
