//
//  ViewController.m
//  BlockTest
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "BlockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlockView *view = [[BlockView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    [view setBackgroundColor:[UIColor yellowColor]];
    view.alpha = 0.0f;
    [self.view addSubview:view];
    
    [view blockView:^(id result) {
        NSLog(@"%@", result);
    }];
    
    [UIView animateWithDuration:2 animations:^{
        view.alpha = 1.0f;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end