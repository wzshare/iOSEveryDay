//
//  BlockView.m
//  BlockTest
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

- (void)blockView:(void(^)(id result))block {
    block(@"finish");
}

@end

