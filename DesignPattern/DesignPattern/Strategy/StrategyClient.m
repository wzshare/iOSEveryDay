//
//  StrategyClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "StrategyClient.h"
#import "StrategyA.h"
#import "StrategyB.h"
#import "StrategyContext.h"

@implementation StrategyClient
- (void)pattern {
    Strategy *s1 = [StrategyA new];
    StrategyContext *cxt = [StrategyContext new];
    [cxt setStrategy:s1];
    [cxt algorithm];
    
    Strategy *s2 = [StrategyB new];
    [cxt setStrategy:s2];
    [cxt algorithm];
}
@end
