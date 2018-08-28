//
//  ConcreteColleague.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "ConcreteColleague.h"

@implementation ConcreteColleague
- (void)receivemsg:(NSString *)msg {
    NSLog(@"Colleague %d reveivemsg: %@", self.index, msg);
}
- (void)sendmsg:(int)index message:(NSString *)msg {
    Mediator *mMediator = self.mediator;
    [mMediator operation:index message:msg];
}
@end
