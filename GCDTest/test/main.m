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

int main()
{
//    GCDTest *gcd = [[GCDTest alloc] init];
//    [gcd runMaxTreadAndGroup];
    SemaphoreTest *test = [[SemaphoreTest alloc] init];
    [test semaphoreDemo];
    
    return 0;
}
