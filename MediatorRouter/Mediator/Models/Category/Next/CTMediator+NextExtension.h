//
//  CTMediator+NextExtension.h
//  MediatorRouter
//
//  Created by iCocos on 2018/11/7.
//  Copyright © 2018年 iCocos. All rights reserved.
//

#import "CTMediator.h"

@interface CTMediator (NextExtension)

- (UIViewController *)getNextVCWithTitle:(NSString *)title block:(void (^)(NSString *))block;

@end
