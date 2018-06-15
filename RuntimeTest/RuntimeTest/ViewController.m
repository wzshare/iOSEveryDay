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
#import "RTXiaoMing.h"
#import "NSObject+Sark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     add property to category
     */
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.ry_time = 1.0f;
//    NSLog(@"%f", button.ry_time);
    
    /*
     dynamic function
     */
//    RTStudent *student = [[RTStudent alloc] init];
//    [student performSelector:@selector(speak:) withObject:@"runtime"];
    
    /*
     Self & Super
     */
//    RTXiaoMing *xiaoming = [[RTXiaoMing alloc] init];
    
    /*
     Object & Class & Meta Clas
     */
//    [xiaoming xiaoming];
    
    [NSObject foo];
    [[NSObject new] foo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
