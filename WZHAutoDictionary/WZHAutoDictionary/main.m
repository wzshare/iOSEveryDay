//
//  main.m
//  WZHAutoDictionary
//
//  Created by 王哲 on 2018/8/30.
//  Copyright © 2018年 WangZhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZHAutoDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WZHAutoDictionary *dic = [WZHAutoDictionary new];
        dic.string = @"Today is sunny.";
        NSLog(@"weather: %@", dic.string);
    }
    return 0;
}
