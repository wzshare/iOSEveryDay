//
//  ViewController.m
//  WZHFPS
//
//  Created by wangzhe on 2018/10/29.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) int scheduleTimes;
@property (nonatomic, assign) CFTimeInterval timestamp;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupDisplayLink];
}

- (void)setupDisplayLink {
    //创建CADisplayLink，并添加到当前run loop的NSRunLoopCommonModes
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTicks:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)linkTicks:(CADisplayLink *)link
{
    //执行次数
    _scheduleTimes ++;
    
    //当前时间戳
    if(_timestamp == 0){
        _timestamp = link.timestamp;
    }
    CFTimeInterval timePassed = link.timestamp - _timestamp;
    
    if(timePassed >= 1.f)
    {
        //fps
        CGFloat fps = _scheduleTimes / timePassed;
        printf("fps:%.1f, timePassed:%f\n", fps, timePassed);
        
        //reset
        _timestamp = link.timestamp;
        _scheduleTimes = 0;
    }
}

@end
