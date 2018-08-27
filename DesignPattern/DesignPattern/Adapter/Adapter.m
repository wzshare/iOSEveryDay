//
//  Adapter.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Adapter.h"
@interface Adapter ()
{
    Adaptee *mAdaptee;
}
@end

@implementation Adapter
- (instancetype)initWithAdaptee:(Adaptee *)adaptee {
    self = [super init];
    if (self) {
        mAdaptee = adaptee;
    }
    return self;
}
- (void)request {
    [mAdaptee specialRequest];
}
@end
