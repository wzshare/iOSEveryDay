//
//  ViewController.m
//  WZHAutoLayout
//
//  Created by wangzhe on 2018/9/25.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"

static NSString * const KAutoLayoutIdentifier = @"KAutoLayoutIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AutoLayout" bundle:nil];
    self.controllers = @[[storyboard instantiateViewControllerWithIdentifier:@"SimpleViewController"],
                         [storyboard instantiateViewControllerWithIdentifier:@"StoryBoardViewController"]];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [self.controllers objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:KAutoLayoutIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KAutoLayoutIdentifier];
    }
    cell.textLabel.text = controller.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [self.controllers objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
