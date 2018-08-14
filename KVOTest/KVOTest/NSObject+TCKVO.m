//
//  NSObject+TCKVO.m
//  KVOTest
//
//  Created by wangzhe on 2018/8/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//
//  用 try catch 防止多次 removeObserver

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
    Class class = [self class];
    SEL originalSelector = @selector(removeObserver:forKeyPath:context:);
    SEL swizzledSelector = @selector(tc_removeObserver:forKeyPath:context:);
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)tc_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context {
    @try {
        [self tc_removeObserver:observer forKeyPath:keyPath context:context];
    } @catch (NSException *exception) {
        NSLog(@"Remove observer more than once.");
    }

}
@end
