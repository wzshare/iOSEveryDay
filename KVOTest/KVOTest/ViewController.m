//
//  ViewController.m
//  KVOTest
//
//  Created by wangzhe on 2018/6/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "KVOView.h"
#import "BlueView.h"
#import "Father.h"

@interface ViewController ()
@property(nonatomic, assign) BOOL num;
@property(nonatomic, strong) Father *fView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.num = true;
    
//    KVOView *view = [[KVOView alloc] initWithFrame:CGRectMake(0, 60, 150, 150)];
//    [view setBackgroundColor:[UIColor yellowColor]];
//    [self.view addSubview:view];
//
//    BlueView *blue = [[BlueView alloc] initWithFrame:CGRectMake(150, 60, 150, 150)];
//    [blue setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:blue];
//
//    [self addObserver:view forKeyPath:@"num" options:NSKeyValueObservingOptionNew context:nil];
//    [self addObserver:blue forKeyPath:@"num" options:NSKeyValueObservingOptionNew context:nil];

//    self.fView = [[Father alloc] initWithFrame:CGRectMake(0, 210, 150, 150)];
//    self.fView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:self.fView];
    
    Father *fview = [[Father alloc] initWithFrame:CGRectMake(0, 210, 150, 150)];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(click:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)click:(id)sender {
    self.num = !self.num;
    [self.fView changeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
