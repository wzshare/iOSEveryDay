//
//  FlyweightClient.m
//  DesignPattern
//
//  Created by 王哲 on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FlyweightClient.h"
#import "FlyweightFactory.h"
#import "Flyweight.h"

@implementation FlyweightClient
- (void)pattern {
    FlyweightFactory *factory = [FlyweightFactory new];
    Flyweight *fw = [factory getFlyweight:@"one"];
    [fw operation];
    
    Flyweight *fw2 = [factory getFlyweight:@"two"];
    [fw2 operation];
}
@end
