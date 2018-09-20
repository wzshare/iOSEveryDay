//
//  ClockViewController.m
//  CoreAnimationTest
//
//  Created by 王哲 on 2018/9/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController () <CAAnimationDelegate>
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *hourImg;
@property (weak, nonatomic) IBOutlet UIImageView *minuteImg;
@property (weak, nonatomic) IBOutlet UIImageView *secondImg;
@property (weak, nonatomic) IBOutlet UIImageView *blueView;

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
    
    // CAShapeLayer + UIBezierPath
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.frame = self.blueView.bounds;
//    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.blueView.bounds cornerRadius:15.0].CGPath;
//    self.blueView.layer.mask = shapeLayer;
    
    // UIBezierPath + CoreGraphics
//    UIGraphicsBeginImageContextWithOptions(self.blueView.bounds.size, NO, [UIScreen mainScreen].scale);
//    [[UIBezierPath bezierPathWithRoundedRect:self.blueView.bounds cornerRadius:15.0] addClip];
//    [self.blueView drawRect:self.blueView.bounds];
//    self.blueView.backgroundColor = [UIColor clearColor];
//    self.blueView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    // CALayer + contentsCenter
//    CALayer *contents = [CALayer layer];
//    contents.frame = self.blueView.bounds;
//    contents.contentsCenter = CGRectMake(0.5, 0.5, 0, 0);
//    contents.contentsScale = [UIScreen mainScreen].scale;
//    contents.contents = (__bridge id)[UIImage imageNamed:@"google"].CGImage;
//    self.blueView.layer.mask = contents;
    
    // copy UIView to UIImage
//    UIImage * img = [self imageWithView:self.titleView];
//    self.blueView.backgroundColor = [UIColor clearColor];
//    self.blueView.image = img;
    
    // copy UIView to UIImage
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage * img = [self snapshot:self.titleView];
        self.blueView.backgroundColor = [UIColor clearColor];
        self.blueView.image = img;
    });
    
    self.secondImg.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteImg.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourImg.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
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
    
    [self updateClockAnimated:YES];
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
    CGFloat x = digit % 4 * 0.25;
    CGFloat y = digit / 4 * 0.33;
    view.layer.contentsRect = CGRectMake(x, y, 0.25, 0.33);
}

- (void)updateClockAnimated:(BOOL)animated {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    CGFloat hourAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minuteAngle = (components.minute / 60.0) * M_PI * 2.0;
    CGFloat secondAngle = (components.second / 60.0) * M_PI * 2.0;
    [self setAngle:hourAngle forHand:self.hourImg animated:animated];
    [self setAngle:minuteAngle forHand:self.minuteImg animated:animated];
    [self setAngle:secondAngle forHand:self.secondImg animated:animated];
}

- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated
{
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animation];
        [self updateClockAnimated:NO];
        animation.keyPath = @"transform";
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.duration = 0.5;
        animation.delegate = self;
        [animation setValue:handView forKey:@"handView"];
        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:1.0 :0.0 :0.75 :1.0];
        [handView.layer addAnimation:animation forKey:nil];
    } else {
        handView.layer.transform = transform;
    }
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    UIView *handView = [anim valueForKey:@"handView"];
    handView.layer.transform = [anim.toValue CATransform3DValue];
}

- (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0f);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

// drawViewHierarchyInRect:afterScreenUpdates: more faster than renderInContext:
- (UIImage *)snapshot:(UIView *)view
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    // There he is! The new API method
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    return snapshotImage;
}

@end
