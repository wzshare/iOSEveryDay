//
//  SViewController.m
//  WZHProfile
//
//  Created by wangzhe on 2018/10/12.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "SViewController.h"

@interface SViewController ()

@end

@implementation SViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"SViewController init");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSThread sleepForTimeInterval:1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
