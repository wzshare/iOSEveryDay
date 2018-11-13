//
//  ViewController.m
//  BlockTest
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import "BlockView.h"

typedef int (^someblock)(void);

@interface ViewController ()

@end

@implementation ViewController
__weak id reference = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlockView *view = [[BlockView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    [view setBackgroundColor:[UIColor yellowColor]];
    view.alpha = 0.0f;
    [self.view addSubview:view];
    
    [view blockView:^(id result) {
        NSLog(@"%@", result);
    }];
    
    [UIView animateWithDuration:2 animations:^{
        view.alpha = 1.0f;
    }];
    
//    [self testForLoop];
    
    // ARC 中不允许使用 NSAutoreleasePool
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    @autoreleasepool {
    // 避免 Tagged Pointor 字符串要足够长
    NSString *str = [NSString stringWithFormat:@"stringstringstring"];
    reference = str;
//    }
//    [pool release];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^ {
        // 输出 null ，因为 dispatch_after 即使是延迟 0 秒也会在下一个 runloop
        // 在上一个 runloop 休眠时 autoreleasepool 已经释放
        NSLog(@"dispatch %@", reference);
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // reference 有值，因为 viewWillAppear 与 viewDidLoad 在一个 runloop
    NSLog(@"%@", reference);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // null，viewDidAppear 在下一个 runloop
    NSLog(@"%@", reference);
}


- (void)testForLoop {
    
    someblock b[3];
    
    for (int i = 0; i < 3; i++) {
        b[i] = ^() {
            return i; };
    }
    
    for (int i = 0; i < 3; i++) {
        NSLog(@"%p", b[i]);
        NSLog(@"%d", b[i]());
    }
    
    // 在 ARC 下输出 0 1 2，在 MRC 下输出 2 2 2
    // 因为在非 ARC 下，block 是 NSStackBlock
    
    int i = 0;
    void (^__weak block1)(void) = ^() {
        NSLog(@"%d", i);
    };
    block1();
    // ARC 中的 NSStackBlock
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
