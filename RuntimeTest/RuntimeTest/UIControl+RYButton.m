//
//  UIControl+RYButton.m
//  RuntimeTest
//
//  Created by wangzhe on 2018/6/12.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "UIControl+RYButton.h"
#import <objc/runtime.h>

static const char * RY_CLICKKEY = "ry_clickkey";

@implementation UIControl (RYButton)

//dynamic property
- (void)setRy_time:(NSTimeInterval)ry_time{
    objc_setAssociatedObject(self, RY_CLICKKEY, @(ry_time), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)ry_time{
    return [objc_getAssociatedObject(self, RY_CLICKKEY) doubleValue];
}

@end
