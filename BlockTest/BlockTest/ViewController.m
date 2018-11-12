//
//  ViewController.m
//  BlockTest
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "BlockView.h"

typedef int (^someblock)(void);

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
    
    [self testForLoop];
}

- (void)testForLoop {
    
    someblock b[3];
    
    for (int i = 0; i < 3; i++) {
        b[i] = ^() {
            return i; };
    }
    
    for (int i = 0; i < 3; i++) {
        NSLog(@"%p", b[i]);
        NSLog(@"%d", b[i]());
    }
    
    // 在 ARC 下输出 0 1 2，在 MRC 下输出 2 2 2
    // 因为在非 ARC 下，block 是 NSStackBlock
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
