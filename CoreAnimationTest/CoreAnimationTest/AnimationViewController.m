//
//  AnimationViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/17.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (strong, nonatomic) CALayer *colorLayer;
@property (strong, nonatomic) UIView *colorView;
@property (strong, nonatomic) CALayer *pushLayer;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(30, 100, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    self.colorView = [UIView new];
    self.colorView.frame = CGRectMake(200, 100, 100, 100);
    self.colorView.layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view addSubview:self.colorView];
    
    self.pushLayer = [CALayer layer];
    self.pushLayer.frame = CGRectMake(30, 220, 100, 100);
    self.pushLayer.backgroundColor = [UIColor blueColor].CGColor;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.pushLayer.actions = @{@"backgroundColor": transition};
    [self.view.layer addSublayer:self.pushLayer];
    
    // UIView 通过返回 nil 来禁用隐式动画
    NSLog(@"outside: %@", [self.colorView actionForLayer:self.colorView.layer forKey:@"backgroundColor"]);
    [UIView beginAnimations:nil context:nil];
    NSLog(@"inside: %@", [self.colorView actionForLayer:self.colorView.layer forKey:@"backgroundColor"]);
    [UIView commitAnimations];
}

- (IBAction)changeColor:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_4);
        self.colorLayer.affineTransform = transform;
    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}

- (IBAction)changeViewColor:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorView.layer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_4);
        self.colorView.layer.affineTransform = transform;
    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}

- (IBAction)pushColor:(id)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.pushLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}

@end
