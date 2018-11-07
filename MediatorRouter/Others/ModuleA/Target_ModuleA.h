//
//  Target_ModuleA.h
//  CTMediatorDemo
//
//  Created by jiangxintong on 2018/10/24.
//  Copyright © 2018年 jiangxintong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// NS_ASSUME_NONNULL_BEGIN和NS_ASSUME_NONNULL_END -> xcode 10.0创建文件时 会自动写这两个宏
// 在这两个宏之间的代码 所有简单指针对象都被假定为nonnull 我们只需要去指定那些nullable的指针
@interface Target_ModuleA : NSObject

@end

NS_ASSUME_NONNULL_END
