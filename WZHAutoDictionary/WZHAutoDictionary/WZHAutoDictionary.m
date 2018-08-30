//
//  WZHAutoDictionary.m
//  WZHAutoDictionary
//
//  Created by 王哲 on 2018/8/30.
//  Copyright © 2018年 WangZhe. All rights reserved.
//

#import "WZHAutoDictionary.h"
#import <objc/runtime.h>

@interface WZHAutoDictionary ()
@property (nonatomic, strong) NSMutableDictionary *backingStore;
@end

@implementation WZHAutoDictionary

@dynamic string, number, date, opaqueObject;

- (instancetype)init {
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES;
}

id autoDictionaryGetter(id self, SEL _cmd) {
    WZHAutoDictionary *typedSelf = (WZHAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    WZHAutoDictionary *typedSelf = (WZHAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    // 删除 ':'
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    // 删除 'set'
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    // 首字母小写
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}
@end
