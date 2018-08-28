//
//  Invoker.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface Invoker : NSObject
- (instancetype)initWithCommand:(Command *)command;
- (void)call;
@end
