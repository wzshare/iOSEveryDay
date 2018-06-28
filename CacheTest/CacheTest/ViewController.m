//
//  ViewController.m
//  CacheTest
//
//  Created by wangzhe on 2018/6/11.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"
#import <YYCache/YYCache.h>
#import "CTViewController.h"
#import "CATAutoDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSLog(@"init");
//    }
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        NSLog(@"initWithCoder:");
//    }
//    return self;
//}

//- (void)loadView {
//    [super loadView];
//    NSLog(@"loadView");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    YYCache *cache = [YYCache cacheWithName:@"mydb"];
//    UserInfo *userinfo = [UserInfo shareInstance];
//    userinfo.age = 28;
//    userinfo.name = @"cache";
//    StudentInfo *student = [[StudentInfo alloc] init];
//    student.identify = 010;
//    student.cities = @[@"beijing"];
//    userinfo.student = student;
//    [cache setObject:userinfo forKey:@"info"];
//
//    NSLog(@"%@",[[(UserInfo *)[cache objectForKey:@"info"] student] cities]);
    
//    CTViewController *ctvController = [[CTViewController alloc] init];
//    [self.navigationController pushViewController:ctvController animated:YES];
    
#pragma mark CATAutoDicionary
    CATAutoDictionary *dict = [CATAutoDictionary new];
    dict.date = [NSDate date];
    NSLog(@"Today is %@", [dict date]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
