//
//  ShapeLayerViewController.m
//  CoreAnimationTest
//
//  Created by 王哲 on 2018/9/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ShapeLayerViewController.h"

@interface ShapeLayerViewController ()

@end

@implementation ShapeLayerViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Shape Layer";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CGPoint point1, point2;
    [function getControlPointAtIndex:1 values:(float * _Nonnull)&point1];
    [function getControlPointAtIndex:2 values:(float * _Nonnull)&point2];
    
    UIBezierPath *bezier = [[UIBezierPath alloc] init];
    [bezier moveToPoint:CGPointZero];
    [bezier addCurveToPoint:CGPointMake(1, 1) controlPoint1:point1 controlPoint2:point2];
    [bezier applyTransform:CGAffineTransformMakeScale(200, 200)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 4.0;
    layer.path = bezier.CGPath;
    
    UIView *mView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 200, 200)];
    mView.backgroundColor = [UIColor whiteColor];
    [mView.layer addSublayer:layer];
    mView.layer.geometryFlipped = YES;
    [self.view addSubview:mView];
}

@end
