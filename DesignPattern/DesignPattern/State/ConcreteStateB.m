//
//  ConcreteStateB.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteStateB.h"
#import "ConcreteStateA.h"

@implementation ConcreteStateB
+ (instancetype)shareInstance {
    static ConcreteStateB *state = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        state = [ConcreteStateB new];
    });
    return state;
}

- (void)handle:(Context *)context {
    NSLog(@"Doing something in State B. ... Done, change state to A.");
    [context changeState:[ConcreteStateA shareInstance]];
}
@end
