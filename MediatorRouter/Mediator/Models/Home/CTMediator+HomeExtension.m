
//
//  CTMediator+HomeExtension.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CTMediator+HomeExtension.h"

@implementation CTMediator (HomeExtension)

- (UIViewController *)getHomeVCWithTitle:(NSString *)title;
{
    NSMutableDictionary * dict = @{}.mutableCopy;
    [dict setValue:title forKey:@"title"];
    return [self performTarget:@"MediatorHomeViewController" action:@"MediatorHomeViewController" params:dict shouldCacheTarget:NO];
}

@end
