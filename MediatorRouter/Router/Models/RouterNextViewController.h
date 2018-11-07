//
//  RouterNextViewController.h
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouterNextViewController : UIViewController

@property (nonatomic, copy) void(^ btnClickBlock)(NSString *);

@end
