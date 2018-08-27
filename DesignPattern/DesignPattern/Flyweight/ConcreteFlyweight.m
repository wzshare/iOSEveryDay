//
//  ConcreteFlyweight.m
//  DesignPattern
//
//  Created by 王哲 on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteFlyweight.h"

@interface ConcreteFlyweight ()
{
    NSString *intrinsicState;
}
@end

@implementation ConcreteFlyweight
- (instancetype)initWithState:(NSString *)state {
    self = [super init];
    if (self) {
        intrinsicState = state;
    }
    return self;
}
- (void)operation {
    NSLog(@"Flyweight[%@] do operation.", intrinsicState);
}
@end
