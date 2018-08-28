//
//  StateClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "StateClient.h"
#import "Context.h"

@implementation StateClient
- (void)pattern {
    Context *c = [Context new];
    [c request];
    [c request];
    [c request];
}
@end
