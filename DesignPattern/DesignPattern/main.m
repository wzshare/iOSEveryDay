//
//  main.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdapterPattern.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AdapterPattern *pAdapter = [AdapterPattern new];
        [pAdapter pattern];
    }
    return 0;
}
