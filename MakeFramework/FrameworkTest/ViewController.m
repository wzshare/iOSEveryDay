//
//  ViewController.m
//  FrameworkTest
//
//  Created by wangzhe on 2018/6/26.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import <MakeFramework/MakeFramework.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestPrint *test = [[TestPrint alloc] init];
    [test printToday];
    [test printCalendar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
