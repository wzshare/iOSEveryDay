//
//  MediatorClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "MediatorClient.h"
#import "ConcreteColleague.h"
#import "ConcreteMediator.h"

@implementation MediatorClient
- (void)pattern {
    ConcreteColleague *pa = [ConcreteColleague new];
    ConcreteColleague *pb = [ConcreteColleague new];
    ConcreteMediator *pm = [ConcreteMediator new];
    [pm registered:1 colleague:pa];
    [pm registered:2 colleague:pb];
    [pa sendmsg:2 message:@"Hello, I'm A"];
    [pa sendmsg:1 message:@"Hello, I'm B"];
}
@end
