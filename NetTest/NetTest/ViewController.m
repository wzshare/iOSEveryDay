//
//  ViewController.m
//  NetTest
//
//  Created by wangzhe on 2018/6/19.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "NTTModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NTTModel *model = [[NTTModel alloc] init];
    NSLog(@"%d", [model.errorCode isKindOfClass:[NSArray class]]);
    NSArray *array = model.errorCode;
    NSLog(@"%d", [array isKindOfClass:[NSArray class]]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
