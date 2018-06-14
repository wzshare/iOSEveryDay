//
//  BlueView.m
//  KVOTest
//
//  Created by wangzhe on 2018/6/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.backgroundColor == [UIColor blueColor]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    else {
        self.backgroundColor = [UIColor blueColor];
    }
}

@end
