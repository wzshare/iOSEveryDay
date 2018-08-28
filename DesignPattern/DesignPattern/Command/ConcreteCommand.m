//
//  ConcreteCommand.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteCommand.h"

@interface ConcreteCommand ()
{
    Receiver *mReceiver;
}
@end

@implementation ConcreteCommand
- (instancetype)initWithReceiver:(Receiver *)receiver {
    self = [super initWithReceiver:receiver];
    if (self) {
        mReceiver = receiver;
    }
    return self;
}

- (void)execute {
    [mReceiver action];
}
@end
