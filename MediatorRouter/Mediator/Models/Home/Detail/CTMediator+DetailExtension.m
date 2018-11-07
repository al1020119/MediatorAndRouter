//
//  CTMediator+DetailExtension.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CTMediator+DetailExtension.h"

@implementation CTMediator (DetailExtension)

- (UIViewController *)getDetailVCWithTitle:(NSString *)title name:(NSString *)name;
{
    NSMutableDictionary * dict = @{}.mutableCopy;
    [dict setValue:name forKey:@"name"];
    [dict setValue:title forKey:@"title"];
    return [self performTarget:@"MediatorDetailViewController" action:@"MediatorDetailViewController" params:dict shouldCacheTarget:NO];
}

@end
