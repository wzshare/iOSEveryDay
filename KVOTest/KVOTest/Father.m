//
//  Father.m
//  KVOTest
//
//  Created by wangzhe on 2018/8/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Father.h"
#import "Color.h"
@interface Father ()
@property (nonatomic, strong) Color *mColor;
@end

@implementation Father

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _mColor = [[Color alloc] init];
        _mColor.color = KTColorRed;
        [_mColor addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc {
    [_mColor removeObserver:self forKeyPath:@"backgroundColor" context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"background color change");
}

- (void)changeColor {
    self.mColor.color = (self.mColor.color + 1) % 3;
    switch (self.mColor.color) {
        case KTColorRed:
            self.backgroundColor = [UIColor redColor];
            break;
        case KTColorGreen:
            self.backgroundColor = [UIColor greenColor];
            break;
        case KTColorYellow:
            self.backgroundColor = [UIColor yellowColor];
            break;
    }
}

@end
