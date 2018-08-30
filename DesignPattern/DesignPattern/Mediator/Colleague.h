//
//  Colleague.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mediator.h"

@interface Colleague : NSObject
@property (nonatomic, strong) Mediator *mediator;
@property (nonatomic, assign) int index;
- (void)receivemsg:(NSString *)msg;
- (void)sendmsg:(int)index message:(NSString *)msg;
@end
