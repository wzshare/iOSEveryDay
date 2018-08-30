//
//  CommandClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "CommandClient.h"
#import "Receiver.h"
#import "ConcreteCommand.h"
#import "Invoker.h"

@implementation CommandClient
- (void)pattern {
    Receiver *pReceiver = [Receiver new];
    ConcreteCommand *pCommand = [[ConcreteCommand alloc] initWithReceiver:pReceiver];
    Invoker *pInvoker = [[Invoker alloc] initWithCommand:pCommand];
    [pInvoker call];
}
@end
