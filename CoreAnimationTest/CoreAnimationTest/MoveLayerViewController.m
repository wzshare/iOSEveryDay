//
//  MoveLayerViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/17.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "MoveLayerViewController.h"

@interface MoveLayerViewController ()
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation MoveLayerViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Move Layer";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = self.view.center;
    self.colorLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() % 256 / 256.0;
        CGFloat green = arc4random() % 128 / 256.0;
        CGFloat blue = arc4random() % 128 / 256.0 + 0.5;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
        NSLog(@"r%f, g%f, b%f", red, green, blue);
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:3.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

@end
