//
//  main.m
//  test
//
//  Created by wangzhe on 16/3/24.
//  Copyright © 2016年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDTest.h"
#import "SemaphoreTest.h"
#import "GCDBarrier.h"

int main()
{
//    GCDTest *gcd = [[GCDTest alloc] init];
//    [gcd runMaxTreadAndGroup];
    GCDBarrier *test = [[GCDBarrier alloc] init];
//    NSLog(@"------ gcd barrier sync --------");
//    [test barrierSync];
    NSLog(@"------ gcd barrier async --------");
    [test barrierAsync];
    
    return 0;
}
