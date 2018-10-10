//
//  LoopTableView.m
//  LoopTableView
//
//  Created by wangzhe on 2018/10/10.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "LoopTableView.h"
#import "LoopTableViewInterceptor.h"

@interface LoopTableView ()
@property (nonatomic, strong) LoopTableViewInterceptor *interceptor;
@property (nonatomic, assign) NSInteger actualRows;
@end

@implementation LoopTableView
- (void)layoutSubviews {
    [self resetContentOffsetIfNeeded];
    [super layoutSubviews];
}

- (void)resetContentOffsetIfNeeded {
    CGPoint offset = self.contentOffset;
    if (offset.y < 0) {
        offset.y = self.contentSize.height / 3.0;
    } else if (offset.y > self.contentSize.height - self.bounds.size.height) {
        offset.y = self.contentSize.height / 3.0 - self.bounds.size.height;
    }
    [self setContentOffset:offset];
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    self.interceptor.reciver = dataSource;
    [super setDataSource:(id<UITableViewDataSource>)self.interceptor];
}

- (LoopTableViewInterceptor *)interceptor {
    if (!_interceptor) {
        _interceptor = [[LoopTableViewInterceptor alloc] init];
        _interceptor.middler = self;
    }
    return _interceptor;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.actualRows = [self.interceptor.reciver tableView:tableView numberOfRowsInSection:section];
    return self.actualRows * 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *actualIndexPath = [NSIndexPath indexPathForRow:indexPath.row % self.actualRows inSection:indexPath.section];
    UITableViewCell *cell = [self.interceptor.reciver tableView:tableView cellForRowAtIndexPath:actualIndexPath];
    return cell;
}
@end
