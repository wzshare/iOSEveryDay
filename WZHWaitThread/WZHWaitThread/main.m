//
//  main.m
//  WZHWaitThread
//
//  Created by wangzhe on 2018/8/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZHGCDCase.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WZHGCDCase *gcdCase = [WZHGCDCase new];
//        [gcdCase waitThreadWithSemaphore];
//        [gcdCase waitThreadWithBarrier];
        [gcdCase waitThreadWithGroup];
    }
    sleep(5);
    return 0;
}
