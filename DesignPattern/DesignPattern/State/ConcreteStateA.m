//
//  ConcreteStateA.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteStateA.h"
#import "ConcreteStateB.h"

@implementation ConcreteStateA

+ (instancetype)shareInstance {
    static ConcreteStateA *state = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        state = [ConcreteStateA new];
    });
    return state;
}

- (void)handle:(Context *)context {
    NSLog(@"Doing something in State A. ... Done, change state to B.");
    [context changeState:[ConcreteStateB shareInstance]];
}
@end
