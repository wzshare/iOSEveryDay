//
//  GCDTest.m
//  test
//
//  Created by wangzhe on 2018/6/4.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "GCDTest.h"

@implementation GCDTest

- (void)runMaxTreadWithGCD
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t serialQueue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    for (int i = 0; i < 10; i++) {
        dispatch_async(serialQueue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            dispatch_async(concurrentQueue, ^{
                NSLog(@"%@ -- %d", [NSThread currentThread], i);
                dispatch_semaphore_signal(semaphore);
            });
        });
    }
    NSLog(@"end");
}

- (void)runGroupWithGCD
{
    NSLog(@"start");
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrent Queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < 10; i++) {
        dispatch_group_async(group, concurrentQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
    }
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"end group");
    });
    NSLog(@"end");
}

- (void)runMaxTreadAndGroup
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    for (int i = 0; i < 10; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, concurrentQueue, ^{
            NSLog(@"%@ -- %d", [NSThread currentThread], i);
            dispatch_semaphore_signal(semaphore);
        });
    }
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"end group %@", [NSThread currentThread]);
    });
}
@end
