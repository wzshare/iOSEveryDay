//
//  ClockViewController.m
//  CoreAnimationTest
//
//  Created by 王哲 on 2018/9/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *titleView;

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *digits = [UIImage imageNamed:@"number"];
    for (UIView *view in self.digitViews) {
        view.layer.contents = (__bridge id _Nullable)(digits.CGImage);
        view.layer.contentsRect = CGRectMake(0, 0, 0.25, 0.33);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.titleView.layer.cornerRadius = 10.0;
    self.titleView.alpha = 0.5;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    [self tick];
}

- (void)tick {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    [self setDigit:components.hour / 10 forView:self.digitViews[0]];
    [self setDigit:components.hour % 10 forView:self.digitViews[1]];
    [self setDigit:components.minute / 10 forView:self.digitViews[2]];
    [self setDigit:components.minute % 10 forView:self.digitViews[3]];
    [self setDigit:components.second / 10 forView:self.digitViews[4]];
    [self setDigit:components.second % 10 forView:self.digitViews[5]];
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
    CGFloat x = digit % 4 * 0.25;
    CGFloat y = digit / 4 * 0.33;
    view.layer.contentsRect = CGRectMake(x, y, 0.25, 0.33);
}

@end
