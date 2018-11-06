//
//  UIView+LayoutSubviewsCallback.m
//  WZHLocalPlayer
//
//  Created by wangzhe on 2018/11/6.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "UIView+LayoutSubviewsCallback.h"
#import "objc/runtime.h"

@implementation UIView (LayoutSubviewsCallback)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method newMethod = class_getInstanceMethod(self, @selector(ls_layoutSubviews));
        
        BOOL didAddMethod = class_addMethod(self, @selector(layoutSubviews), method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (didAddMethod) {
            class_replaceMethod(self, @selector(ls_layoutSubviews), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, newMethod);
        }
    });
}

- (void)ls_layoutSubviews {
    [self ls_layoutSubviews];
    
//    !self.layoutSubviewsCallback ?: self.layoutSubviewsCallback(self);
    
    if (self.layoutSubviewsCallback) {
        self.layoutSubviewsCallback(self);
    }
}

- (void)setLayoutSubviewsCallback:(void (^)(UIView *))layoutSubviewsCallback {
    objc_setAssociatedObject(self, "layoutSubviewsCallback", layoutSubviewsCallback, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(UIView *))layoutSubviewsCallback {
    return objc_getAssociatedObject(self, "layoutSubviewsCallback");
}
@end
