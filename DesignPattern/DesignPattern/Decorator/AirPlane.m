//
//  AirPlane.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "AirPlane.h"

@implementation AirPlane
- (void)move {
    [super move];
    [self fly];
}

- (void)fly {
    NSLog(@"I can fly.");
}
@end
