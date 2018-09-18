//
//  MoveLayerViewController.m
//  CoreAnimationTest
//
//  Created by wangzhe on 2018/9/17.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "MoveLayerViewController.h"

@interface MoveLayerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *pickArray;
    CAMediaTimingFunctionName name;
}
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation MoveLayerViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Move Layer";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    pickArray = @[@"Ease In", @"Ease Out", @"EaseInEaseOut", @"Linear"];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = self.view.center;
    self.colorLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() % 256 / 256.0;
        CGFloat green = arc4random() % 128 / 256.0;
        CGFloat blue = arc4random() % 128 / 256.0 + 0.5;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
        NSLog(@"r%f, g%f, b%f", red, green, blue);
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:3.0];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:name]];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return pickArray[row];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return pickArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 25.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (row) {
        case 0:
            name = kCAMediaTimingFunctionEaseIn;
            break;
        case 1:
            name = kCAMediaTimingFunctionEaseOut;
            break;
        case 2:
            name = kCAMediaTimingFunctionEaseInEaseOut;
            break;
        case 3:
            name = kCAMediaTimingFunctionLinear;
            break;
        default:
            break;
    }
}

@end
