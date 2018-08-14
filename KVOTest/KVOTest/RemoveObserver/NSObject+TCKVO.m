//
//  NSObject+TCKVO.m
//  KVOTest
//
//  Created by wangzhe on 2018/8/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "NSObject+TCKVO.h"
#import <objc/runtime.h>

@implementation NSObject (TCKVO)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self switchMethod];
    });
}

+ (void)switchMethod {
    
}

@end
