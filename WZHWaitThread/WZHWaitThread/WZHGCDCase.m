//
//  WZHGCDCase.m
//  WZHWaitThread
//
//  Created by wangzhe on 2018/8/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "WZHGCDCase.h"

@implementation WZHGCDCase

- (void)waitThreadWithSemaphore {
    dispatch_queue_t currentQueue = dispatch_queue_create("current queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    
    dispatch_async(currentQueue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Thread A %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
        dispatch_semaphore_signal(semaphore);
    });

    dispatch_async(currentQueue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"Thread B %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        dispatch_semaphore_signal(semaphore);
    });

    dispatch_async(currentQueue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"Thread C %@", [NSThread currentThread]);
        dispatch_semaphore_signal(semaphore);
        dispatch_semaphore_signal(semaphore);
        // dispatch_semaphore_wait 和 dispatch_semaphore_signal 必须成对使用
    });
    
    NSLog(@"Wait Thread Test.");
}

- (void)waitThreadWithBarrier {
    dispatch_queue_t queue = dispatch_queue_create("current queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"Thread A %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    });
    dispatch_async(queue, ^{
        NSLog(@"Thread B %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
    });
    
    // 注意这里 dispatch_barrier_async 与 dispatch_barrier_sync 的区别，
    // dispatch_barrier_async 在子线程执行，不会影响主线程的执行，dispatch_barrier_sync 在主线程中执行，
    // dispatch_barrier_async 不会影响 @"Wait Thread Test" 的执行，而 dispatch_barrier_sync 必须等
    // barrier 执行完
    dispatch_barrier_sync(queue, ^{
        NSLog(@"barrier %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    });

    dispatch_async(queue, ^{
        NSLog(@"Thread C %@", [NSThread currentThread]);
    });
    
    NSLog(@"Wait Thread Test In %@", [NSThread currentThread]);
}

- (void)waitThreadWithGroup {
    dispatch_queue_t queue = dispatch_queue_create("current queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Thread A %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Thread B %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"Thread C %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        // 不要在主线程使用 dispatch_group_wait，如果 group 中如果添加主队列后
        // 再使用 dispatch_group_wait 有可能引起死锁。
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"Wait Thread Test In %@", [NSThread currentThread]);
    });
}

@end
