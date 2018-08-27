//
//  RefinedAbstraction.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "RefinedAbstraction.h"

@implementation RefinedAbstraction
- (instancetype)initWithImplementor:(Implementor *)imp {
    self = [super initWithImplementor:imp];
    if (self) {
        self.mImp = imp;
    }
    return self;
}
- (void)operation {
    [self.mImp operationImp];
}
@end
