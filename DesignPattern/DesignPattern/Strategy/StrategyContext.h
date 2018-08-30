//
//  StrategyContext.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Strategy.h"

@interface StrategyContext : NSObject
@property (nonatomic, strong) Strategy *strategy;
- (void)algorithm;
@end
