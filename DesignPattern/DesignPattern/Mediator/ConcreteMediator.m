//
//  ConcreteMediator.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteMediator.h"
#import "Colleague.h"

@interface ConcreteMediator ()
{
    NSMutableDictionary *mColleague;
}
@end

@implementation ConcreteMediator

- (instancetype)init {
    self = [super init];
    if (self) {
        mColleague = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return self;
}

- (void)operation:(int)index message:(NSString *)msg {
    Colleague *pc = [mColleague valueForKey:@(index).stringValue];
    if (!pc) {
        NSLog(@"not found.");
        return;
    }
    [pc receivemsg:msg];
}

- (void)registered:(int)index colleague:(Colleague *)col {
    if (![mColleague valueForKey:@(index).stringValue]) {
        [mColleague setValue:col forKey:@(index).stringValue];
        col.index = index;
        [col setMediator:self];
        NSLog(@"Colleague %d is %@", index, col);
    }
}

@end
