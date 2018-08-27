//
//  Robot.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Robot.h"

@implementation Robot
- (void)move {
    [super move];
    [self say];
}

- (void)say {
    NSLog(@"I'm Bumblebee.");
}
@end
