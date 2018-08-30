//
//  Facade.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Facade.h"
#import "SystemA.h"
#import "SystemB.h"
#import "SystemC.h"

@implementation Facade
- (void)wrapOpration {
    SystemA *sysA = [SystemA new];
    [sysA operationA];
    SystemB *sysB = [SystemB new];
    [sysB operationB];
    SystemC *sysC = [SystemC new];
    [sysC operationC];
}
@end
