//
//  LoopTableViewInterceptor.m
//  LoopTableView
//
//  Created by wangzhe on 2018/10/10.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "LoopTableViewInterceptor.h"

@implementation LoopTableViewInterceptor
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.middler respondsToSelector:aSelector]) {
        return self.middler;
    } else if ([self.reciver respondsToSelector:aSelector]) {
        return self.reciver;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.middler respondsToSelector:aSelector]) {
        return YES;
    }
    if ([self.reciver respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}
@end
