//
//  Context.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Context.h"
#import "State.h"
#import "ConcreteStateA.h"

@interface Context ()
{
    State *mState;
}
@end

@implementation Context
- (instancetype)init {
    self = [super init];
    if (self) {
        mState = [ConcreteStateA shareInstance];
    }
    return self;
}
- (void)request {
    [mState handle:self];
}
- (void)changeState:(State *)state {
    mState = state;
}
@end
