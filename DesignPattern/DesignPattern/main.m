//
//  main.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdapterClient.h"
#import "BridgeClient.h"
#import "DecoratorClient.h"
#import "FacadeClient.h"
#import "FlyweightClient.h"
#import "CommandClient.h"
#import "MediatorClient.h"
#import "StateClient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Adapter Pattern
//        AdapterClient *pAdapter = [AdapterClient new];
//        [pAdapter pattern];
        
        // Bridge Pattern
//        BridgeClient *pBridge = [BridgeClient new];
//        [pBridge pattern];
        
        // Decorator Pattern
//        DecoratorClient *pDecorator = [DecoratorClient new];
//        [pDecorator pattern];
        
        // Facade Pattern
//        FacadeClient *pFacade = [FacadeClient new];
//        [pFacade pattern];
        
        // Flyweight Pattern
//        FlyweightClient *pFlyweight = [FlyweightClient new];
//        [pFlyweight pattern];
        
        // Command Pattern
//        CommandClient *pCommand = [CommandClient new];
//        [pCommand pattern];
        
        // Mediator Pattern
//        MediatorClient *pMediator = [MediatorClient new];
//        [pMediator pattern];
        
        // State Pattern
        StateClient *pState = [StateClient new];
        [pState pattern];
    }
    return 0;
}
