//
//  ViewController.m
//  RuntimeTest
//
//  Created by wangzhe on 2018/6/12.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+RYButton.h"
#import "RTStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.ry_time = 1.0f;
    NSLog(@"%f", button.ry_time);
    
    RTStudent *student = [[RTStudent alloc] init];
    [student performSelector:@selector(speak:) withObject:@"runtime"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
