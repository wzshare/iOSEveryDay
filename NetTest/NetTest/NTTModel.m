//
//  NTTModel.m
//  NetTest
//
//  Created by wangzhe on 2018/6/22.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "NTTModel.h"

@interface NTTModel ()
{
    NSMutableArray *_internalErrorCode;
}
@end

@implementation NTTModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalErrorCode = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)errorCode {
    return [_internalErrorCode copy];
}

@end
