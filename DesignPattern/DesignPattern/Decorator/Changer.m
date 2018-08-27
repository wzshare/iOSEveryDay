//
//  Changer.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Changer.h"
@interface Changer ()
{
    Transform *mTtransform;
}
@end

@implementation Changer
- (instancetype)initWithDecorator:(Transform *)transform {
    self = [super init];
    if (self) {
        mTtransform = transform;
    }
    return self;
}
- (void)move {
    [mTtransform move];
}
@end
