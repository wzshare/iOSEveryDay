//
//  SimpleViewController.m
//  WZHAutoLayout
//
//  Created by wangzhe on 2018/9/25.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "SimpleViewController.h"

@interface SimpleViewController ()

@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redview = [[UIView alloc] init];
    redview.translatesAutoresizingMaskIntoConstraints = NO;
    redview.backgroundColor = [UIColor redColor];
    [self.view addSubview:redview];
    
    UIView *blueview = [[UIView alloc] init];
    blueview.translatesAutoresizingMaskIntoConstraints = NO;
    blueview.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueview];
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    CGFloat margin = 20;
    [redview.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:margin].active = YES;
    [redview.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor constant:-margin].active = YES;
    [redview.topAnchor constraintEqualToAnchor:guide.topAnchor constant:margin].active = YES;
    [redview.bottomAnchor constraintEqualToAnchor:blueview.topAnchor constant:-margin].active = YES;
    
    [blueview.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:margin].active = YES;
    [blueview.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor constant:-margin].active = YES;
    [blueview.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-margin].active = YES;
    [blueview.heightAnchor constraintEqualToAnchor:redview.heightAnchor multiplier:2.0].active = YES;
}



@end
