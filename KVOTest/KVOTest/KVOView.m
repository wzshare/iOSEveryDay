//
//  KVOView.m
//  KVOTest
//
//  Created by wangzhe on 2018/6/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "KVOView.h"

@implementation KVOView

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.backgroundColor == [UIColor yellowColor]) {
        self.backgroundColor = [UIColor blueColor];
    }
    else {
        self.backgroundColor = [UIColor yellowColor];
    }
}

@end
