//
//  NSObject+class.m
//  test
//
//  Created by wangzhe on 2018/10/9.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "NSObject+class.h"
#import "objc/runtime.h"

@implementation NSObject (class)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self changeMethod];
    });
}

+ (void)changeMethod {
    Class class = [self class];
    SEL originalSelector = @selector(class);
    SEL swizzledSelector = @selector(xxx_class);
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (Class)xxx_class {
    NSLog(@"NSObject");
    return [self xxx_class];
}
@end
