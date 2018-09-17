//
//  ExplicitAnimationViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/17.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ExplicitAnimationViewController.h"

@interface ExplicitAnimationViewController () <CAAnimationDelegate>
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation ExplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 100, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (IBAction)changeColor:(id)sender {
    CGFloat red = arc4random() % 256 / 256.0;
    CGFloat green = arc4random() % 128 / 256.0;
    CGFloat blue = arc4random() % 128 / 256.0 + 0.5;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id _Nullable)(color.CGColor);
    animation.duration = 1.0;
    animation.delegate = self;
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CABasicAnimation *animation = (CABasicAnimation *)anim;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)animation.toValue;
    [CATransaction commit];
}

@end
