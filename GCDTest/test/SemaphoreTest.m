//
//  SemaphoreTest.m
//  test
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "SemaphoreTest.h"

@implementation SemaphoreTest

- (void)semaphoreDemo {
    dispatch_semaphore_t semophore = dispatch_semaphore_create(0);
    NSLog(@"ready");
    [self network:^(id result) {
        NSLog(@"net return %@", result);
        dispatch_semaphore_signal(semophore);
    }];
    NSLog(@"wait");
    dispatch_semaphore_wait(semophore, DISPATCH_TIME_FOREVER);
    NSLog(@"go on");
}

- (void)network:(void(^)(id result))block {
    sleep(2.0);
    block(@(arc4random_uniform(10)));
}

@end
