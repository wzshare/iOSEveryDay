//
//  WZHLoginRegist.m
//  WZHLoginSDK
//
//  Created by wangzhe on 2018/10/10.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "WZHLoginRegist.h"
#import "objc/runtime.h"

@implementation WZHLoginRegist
+ (void)registThirdPlatform:(Class)class {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleClass:class
                  original:@selector(application:openURL:options:)
                  swizzled:@selector(bfmob_application:openURL:options:)];
    });
}

+ (void)swizzleClass:(Class)class original:(SEL)original swizzled:(SEL)swizzled {
    Class originalClass = class;
    Class swizzledClass = [self class];
    SEL originalSelector = original;
    SEL swizzledSelector = swizzled;
    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    
    BOOL registerMethod = class_addMethod(originalClass,
                                          swizzledSelector,
                                          method_getImplementation(swizzledMethod),
                                          method_getTypeEncoding(swizzledMethod));
    if (!registerMethod) {
        return;
    }
    
    swizzledMethod = class_getInstanceMethod(originalClass, swizzledSelector);
    if (!swizzledMethod) {
        return;
    }
    
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

#pragma mark - Method Swizzling
- (BOOL)bfmob_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    // do something
    NSLog(@"Third platform url: %@.", url);
    return [self bfmob_application:app openURL:url options:options];
}
@end
