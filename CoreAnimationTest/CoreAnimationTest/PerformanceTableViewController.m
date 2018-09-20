//
//  PerformanceTableViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/19.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "PerformanceTableViewController.h"

static NSString * const kCellReuseIdentifier = @"kCellReuseIdentifier";

@interface PerformanceTableViewController ()
@property (strong, nonatomic) NSArray *icons;
@end

@implementation PerformanceTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Performance";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.icons = @[@"beans", @"chicken", @"noodle", @"cake"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = arc4random() % 4;
    NSString *title = self.icons[index];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIdentifier];
    }
    cell.textLabel.text = title;
    cell.imageView.image = [UIImage imageNamed:title];
    return cell;
}

@end
