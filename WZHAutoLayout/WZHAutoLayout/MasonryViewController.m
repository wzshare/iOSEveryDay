//
//  MasonryViewController.m
//  WZHAutoLayout
//
//  Created by wangzhe on 2018/9/26.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

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
    
    CGFloat margin = 20;
    [redview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).with.offset(margin);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft).with.offset(margin);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight).with.offset(-margin);
        make.bottom.mas_equalTo(blueview.mas_top).with.offset(-margin);
    }];
    [blueview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft).with.offset(margin);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight).with.offset(-margin);
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).with.offset(-margin);
        make.height.mas_equalTo(redview.mas_height).with.multipliedBy(2.0);
    }];
}

@end
