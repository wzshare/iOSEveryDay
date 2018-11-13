//
//  MainQueue.m
//  test
//
//  Created by wangzhe on 2018/11/13.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "MainQueue.h"

@implementation MainQueue
// main queue and main thread
- (void)test {
    // test1
    // 主队列中同步，会死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"main");
//    });
    
    // test2
    // 主队列中异步，先输出 2 再输出 1
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"1");
//    });
//    NSLog(@"2");
    
    // test3
    // 主线程中串行队列同步执行，不会死锁，先输出 1 再输出 2
    // - (void)test 方法在主队列中执行，NSLog(@"1") 在 queue 中执行
    // queue 中没有其他任务，所以 NSLog(@"1") 不用等待，会直接执行，执行在主线程
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"1");
        // <NSThread: 0x102006330>{number = 1, name = main}
        NSLog(@"%@", [NSThread currentThread]);
    });
    NSLog(@"2");
    // <NSThread: 0x102006330>{number = 1, name = main}
    NSLog(@"%@", [NSThread currentThread]);
}
@end
