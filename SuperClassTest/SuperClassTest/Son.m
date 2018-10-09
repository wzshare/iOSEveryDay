//
//  Son.m
//  test
//
//  Created by wangzhe on 2018/7/3.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Son.h"

@implementation Son

//- (Class)class {
//    return objc_getClass("Son");
//}

- (void)ouputClass {
    NSLog(@"%@", [self class]);
    NSLog(@"%@", [super class]);
}

@end
