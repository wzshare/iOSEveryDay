//
//  ViewController.m
//  FRPexercise
//
//  Created by wangzhe on 2018/6/5.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@1, @2, @3];
    
/*
 * 流是值的序列化的抽象，你可以认为一个流就像一条水管，而值就是流淌在水管中的水，
 * 值从管道的一端流入从另一端流出。
 */
//    mapping
//    将数组转化成一个序列类型的流。
//    RACSequence *sequence = [array rac_sequence];
//    对流进行映射得到一个新的流。
//    [sequence map:^id(id value) {
//        return @(pow([value integerValue], 2.0));
//    }];
//    将新的流转为数组。
//    NSLog(@"%@", [sequence array]);
    NSLog(@"%@", [[[array rac_sequence] map:^id(id value) {
        return @(pow([value integerValue], 2.0));
    }] array]);
    
//    filtering
    NSLog(@"%@", [[[array rac_sequence] filter:^BOOL(id value) {
        return [value integerValue] % 2 == 0;
    }] array]);
    
//    folding
/*
 * ReactiveCocoa具有左折叠和右折叠的概念。左折叠时折叠算法将从头到尾遍历数组，反之称为右折叠。
 */
    NSLog(@"%@", [[[array rac_sequence] map:^id(id value) {
        return [value stringValue];
    }] foldLeftWithStart:@"" reduce:^id(id accumulator, id value) {
        return [accumulator stringByAppendingString:value];
    }]);
    
//    subscribe
//    [self.textField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"new value %@", x);
//    } error:^(NSError *error) {
//        NSLog(@"error %@", error);
//    } completed:^{
//        NSLog(@"completed.");
//    }];
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"new value %@", x);
    }];
    
//    Deriving State
    RACSignal *emailSignal = [self.textField.rac_textSignal map:^id(id value) {
        return @([value rangeOfString:@"@"].location != NSNotFound);
    }];
//    RAC(self.button, enabled) = emailSignal;
    RAC(self.textField, textColor) = [emailSignal map:^id(id value) {
        if ([value boolValue]) {
            return [UIColor greenColor];
        }
        else {
            return [UIColor redColor];
        }
    }];
    
//    Commands
//    需要注释掉RAC(self.button, enabled) = emailSignal;
    self.button.rac_command = [[RACCommand alloc] initWithEnabled:emailSignal signalBlock:^RACSignal *(id input) {
        NSLog(@"button was pressed");
        return [RACSignal empty];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
