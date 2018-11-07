
//
//  CTMediator+CategoryExtension.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CTMediator+CategoryExtension.h"

@implementation CTMediator (CategoryExtension)

- (UIViewController *)getCategoryVCWithTitle:(NSString *)title;
{
    NSMutableDictionary * dict = @{}.mutableCopy;
    [dict setValue:title forKey:@"title"];
    return [self performTarget:@"RouterCategoryViewController" action:@"RouterCategoryViewController" params:dict shouldCacheTarget:NO];
}

@end
