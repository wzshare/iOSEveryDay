//
//  TransformViewController.m
//  CoreAnimationTest
//
//  Created by 王哲 on 2018/9/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerview;
@property (weak, nonatomic) IBOutlet UIImageView *layerview2;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    self.layerview.layer.affineTransform = transform;
    self.layerview.layer.borderWidth = 2.0;
    
    CGAffineTransform transform2 = CGAffineTransformIdentity;
    transform2 = CGAffineTransformScale(transform2, 0.5, 0.5);
    transform2 = CGAffineTransformTranslate(transform2, 0, 100);
    transform2 = CGAffineTransformRotate(transform2, -M_PI_4);
//    transform2 = CGAffineTransformTranslate(transform2, 0, 200);
    self.layerview2.layer.affineTransform = transform2;
    
    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    self.yellowView.layer.transform = outer;
    CATransform3D inner = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    self.greenView.layer.transform = inner;
}

@end
