//
//  ShadowPathViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ShadowPathViewController.h"

@interface ShadowPathViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ShadowPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image1.layer.shadowOpacity = 0.5;
    self.image2.layer.shadowOpacity = 0.5;
    
    // create a square shadow
    CGMutablePathRef square = CGPathCreateMutable();
    CGPathAddRect(square, NULL, CGRectInset(self.image1.bounds, -20, -20));
    self.image1.layer.shadowPath = square;
    CGPathRelease(square);
    
    // create a circular shadow
    CGMutablePathRef circyle = CGPathCreateMutable();
    CGPathAddEllipseInRect(circyle, NULL, CGRectInset(self.image2.bounds, -20, -20));
    self.image2.layer.shadowPath = circyle;
    CGPathRelease(circyle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
