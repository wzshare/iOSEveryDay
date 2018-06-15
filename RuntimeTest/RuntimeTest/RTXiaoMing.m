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

@end
