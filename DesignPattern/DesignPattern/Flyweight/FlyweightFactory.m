//
//  FlyweightFactory.m
//  DesignPattern
//
//  Created by 王哲 on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FlyweightFactory.h"
#import "ConcreteFlyweight.h"

@interface FlyweightFactory ()
@property (nonatomic, strong) NSMutableDictionary *mpFlyweight;
@end

@implementation FlyweightFactory
- (Flyweight *)getFlyweight:(NSString *)weight {
    Flyweight *flyweight = nil;
    if (_mpFlyweight) {
        flyweight = [[ConcreteFlyweight alloc] initWithState:weight];
        _mpFlyweight = [NSMutableDictionary dictionaryWithObject:flyweight forKey:weight];
    } else if ([_mpFlyweight valueForKey:weight]) {
        NSLog(@"Already exist.");
        flyweight = [_mpFlyweight valueForKey:weight];
    } else {
        flyweight = [[ConcreteFlyweight alloc] initWithState:weight];
        [_mpFlyweight setObject:flyweight forKey:weight];
    }
    return flyweight;
}
@end
