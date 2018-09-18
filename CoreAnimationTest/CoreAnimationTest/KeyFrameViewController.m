//
//  KeyFrameViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/18.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()

@end

@implementation KeyFrameViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Key Frame";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.view.frame.size.width;
    UIBezierPath *bezier = [[UIBezierPath alloc] init];
    [bezier moveToPoint:CGPointMake(0, 150)];
    [bezier addCurveToPoint:CGPointMake(width, 150) controlPoint1:CGPointMake(width / 4, 0) controlPoint2:CGPointMake(width / 4 * 3, width)];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = bezier.CGPath;
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = [UIColor cyanColor].CGColor;
    shape.lineWidth = 5.0f;
    [self.view.layer addSublayer:shape];
    
    CALayer *ship = [CALayer layer];
    ship.frame = CGRectMake(0, 0, 60, 60);
    ship.anchorPoint = CGPointMake(0.5, 0.9);
    ship.position = CGPointMake(0, 150);
    ship.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.view.layer addSublayer:ship];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezier.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [ship addAnimation:animation forKey:nil];
    
    CALayer *ship2 = [CALayer layer];
    ship2.frame = CGRectMake(0, 0, 60, 60);
    ship2.position = self.view.center;
    ship2.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.view.layer addSublayer:ship2];
    
    CABasicAnimation *basic = [CABasicAnimation animation];
    basic.keyPath = @"transform.rotation";
    basic.duration = 4.0;
    basic.byValue = @(M_PI * 2);
    [ship2 addAnimation:basic forKey:nil];
}

@end
