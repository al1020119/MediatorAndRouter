//
//  CTMediator+NextExtension.m
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CTMediator+NextExtension.h"

@implementation CTMediator (NextExtension)

- (UIViewController *)getNextVCWithTitle:(NSString *)title block:(void (^)(NSString *))block;
{
    NSMutableDictionary * dict = @{}.mutableCopy;
    [dict setValue:title forKey:@"title"];
    [dict setValue:block forKey:@"block"];
    return [self performTarget:@"MediatorNextViewController" action:@"MediatorNextViewController" params:dict shouldCacheTarget:NO];
}

@end
