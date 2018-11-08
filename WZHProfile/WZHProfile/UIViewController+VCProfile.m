//
//  UIViewController+VCProfile.m
//  WZHProfile
//
//  Created by wangzhe on 2018/10/12.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "UIViewController+VCProfile.h"
#import "objc/runtime.h"

static char const kAssociatedRemoverKey;

static NSString *const kUniqueFakeKeyPath = @"pmy_useless_key_path";

static void xxx_viewDidLoad(UIViewController *kvo_self, SEL _sel) {
    Class kvo_class = object_getClass(kvo_self);
    Class origin_cls = class_getSuperclass(kvo_class);
    IMP origin_imp = method_getImplementation(class_getInstanceMethod(origin_cls, _sel));
    
    void (*func)(UIViewController *, SEL) = (void (*)(UIViewController *, SEL))origin_imp;
    
    CGFloat start = CFAbsoluteTimeGetCurrent();
    func(kvo_self, _sel);
    CGFloat end = CFAbsoluteTimeGetCurrent();
    NSLog(@"VC: %p -viewDidLoad \tcost:\t%lf", kvo_self, end - start);
}

@implementation MTHFakeKVOObserver

+ (instancetype)shared {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end

@implementation MTHFakeKVORemover

- (void)dealloc {
    if (_target) {
        [_target removeObserver:[MTHFakeKVOObserver shared] forKeyPath:_keyPath];
        _target = nil;
    }
}

@end

@implementation UIViewController (VCProfile)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [self swizzleInClass:[self class]
//                    original:@selector(initWithCoder:)
//                    swizzled:@selector(xxx_initWithCoder:)];
        [self swizzleInClass:[self class]
                    original:@selector(initWithNibName:bundle:)
                    swizzled:@selector(xxx_initWithNibName:bundle:)];
    });
}

- (nullable instancetype)xxx_initWithCoder:(NSCoder *)aDecoder {
    [self createAndHookKVOClass];
//    [self swizzleKVOClass];
    [self xxx_initWithCoder:aDecoder];
    return self;
}

- (instancetype)xxx_initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    [self createAndHookKVOClass];
//    [self swizzleKVOClass];
    [self xxx_initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)swizzleKVOClass {
    Class mClass = object_getClass(self);
    NSLog(@"Hook Class: %@", mClass);
    [UIViewController swizzleInClass:mClass original:@selector(viewDidLoad) swizzled:@selector(my_viewDidLoad)];
}

- (void)createAndHookKVOClass {
    // Setup KVO, which trigger runtime to create the KVO subclass of VC.
    [self addObserver:[MTHFakeKVOObserver shared] forKeyPath:kUniqueFakeKeyPath options:NSKeyValueObservingOptionNew context:nil];
    
    // Setup remover of KVO, automatically remove KVO when VC dealloc.
    MTHFakeKVORemover *remover = [[MTHFakeKVORemover alloc] init];
    remover.target = self;
    remover.keyPath = kUniqueFakeKeyPath;
    objc_setAssociatedObject(self, &kAssociatedRemoverKey, remover, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // NSKVONotifying_ViewController
    Class kvoCls = object_getClass(self);
    Class oCls = [self class];
    
    // Compare current Imp with our Imp. Make sure we didn't hooked before.
    IMP currentViewDidLoadImp = class_getMethodImplementation(kvoCls, @selector(viewDidLoad));
    if (currentViewDidLoadImp == (IMP)xxx_viewDidLoad) {
        return;
    }
    
    // ViewController
    Class originCls = class_getSuperclass(kvoCls);
    NSLog(@"Hook %@", kvoCls);
    
    // 获取原来实现的encoding
    const char *originViewDidLoadEncoding = method_getTypeEncoding(class_getInstanceMethod(originCls, @selector(viewDidLoad)));
    
    // 重点，添加方法。
    class_addMethod(kvoCls, @selector(viewDidLoad), (IMP)xxx_viewDidLoad, originViewDidLoadEncoding);
}

- (void)my_viewDidLoad {
    NSDate *date = [NSDate date];
    [self my_viewDidLoad];
    NSTimeInterval duration = [[NSDate date] timeIntervalSinceDate:date];
    NSLog(@"%@ cost %g", [self class], duration);
}

+ (void)swizzleInClass:(Class)class original:(SEL)originalSelector swizzled:(SEL)swizzledSelector {
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

@end
