//
//  RTXiaoMing.m
//  RuntimeTest
//
//  Created by wangzhe on 2018/6/15.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "RTXiaoMing.h"

@implementation RTXiaoMing

- (id)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

- (void)xiaoming {
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res3 = [(id)[RTXiaoMing class] isKindOfClass:[RTXiaoMing class]];
    BOOL res4 = [(id)[RTXiaoMing class] isMemberOfClass:[RTXiaoMing class]];
    NSLog(@"%d %d %d %d", res1, res2, res3, res4);
}

@end
