//
//  BridgeClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "BridgeClient.h"
#import "RefinedAbstraction.h"
#import "ConcreteImplementorA.h"
#import "ConcreteImplementorB.h"

@implementation BridgeClient
- (void)pattern {
    Implementor * pImp = [ConcreteImplementorA new];
    Abstraction * pa = [[RefinedAbstraction alloc] initWithImplementor:pImp];
    [pa operation];
    
    Abstraction * pb = [[RefinedAbstraction alloc] initWithImplementor:[ConcreteImplementorB new]];;
    [pb operation];
}
@end
