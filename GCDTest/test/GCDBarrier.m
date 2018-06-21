//
//  GCDBarrier.m
//  test
//
//  Created by wangzhe on 2018/6/21.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "GCDBarrier.h"

@implementation GCDBarrier

- (void)barrierAsync {
    
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue 1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"test 1");
    });
    dispatch_async(queue, ^{
        NSLog(@"test 2");
    });
    dispatch_async(queue, ^{
        NSLog(@"test 3");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"test 0");
    });
    dispatch_async(queue, ^{
        NSLog(@"test 4");
    });
    NSLog(@"aaa");
    dispatch_async(queue, ^{
        NSLog(@"test 5");
    });
    NSLog(@"bbb");
    dispatch_async(queue, ^{
        NSLog(@"test 6");
    });
}

- (void)barrierSync {
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue 2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"test 1");
    });
    dispatch_async(queue, ^{
        NSLog(@"test 2");
    });
    dispatch_async(queue, ^{
        NSLog(@"test 3");
    });
    dispatch_barrier_sync(queue, ^{
        for (int i = 0; i < 50000; i++) {
            if (i == 25000) {
                NSLog(@"test 0");
            }
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"test 4");
    });
    NSLog(@"aaa");
    dispatch_async(queue, ^{
        NSLog(@"test 5");
    });
    NSLog(@"bbb");
    dispatch_async(queue, ^{
        NSLog(@"test 6");
    });
}

@end
