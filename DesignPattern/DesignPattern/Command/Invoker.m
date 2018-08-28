//
//  Invoker.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()
{
    Command *mCommand;
}
@end

@implementation Invoker
- (instancetype)initWithCommand:(Command *)command {
    self = [super init];
    if (self) {
        mCommand = command;
    }
    return self;
}
- (void)call {
    [mCommand execute];
}
@end
