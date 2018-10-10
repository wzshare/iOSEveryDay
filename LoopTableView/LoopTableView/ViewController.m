//
//  ViewController.m
//  LoopTableView
//
//  Created by wangzhe on 2018/10/10.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "LoopTableView.h"

static NSString * const kLoopIdentifier = @"kLoopIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview = [[LoopTableView alloc] init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.showsVerticalScrollIndicator = NO;
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableview];
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    [self.tableview.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [self.tableview.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    [self.tableview.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [self.tableview.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:kLoopIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:kLoopIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"NO.%ld", indexPath.row + 1];
    cell.backgroundColor = [UIColor colorWithRed:(indexPath.row * 25) / 255.0 green:(100 + indexPath.row * 15) / 255.0 blue:(255 - indexPath.row * 25) / 255.0 alpha:1.0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
