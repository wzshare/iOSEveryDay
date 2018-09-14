//
//  ViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "ShadowPathViewController.h"

static NSString * const kMASCellReuseIdentifier = @"kMASCellReuseIdentifier";

@interface ViewController ()
@property (strong, nonatomic) NSArray *controllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    self.controllers = @[[storyBoard instantiateViewControllerWithIdentifier:@"ShadowPathViewController"]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMASCellReuseIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = self.controllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMASCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"path";//controller.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = self.controllers[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
