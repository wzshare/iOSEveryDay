//
//  Command.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receiver.h"

@interface Command : NSObject
- (instancetype)initWithReceiver:(Receiver *)receiver;
- (void)execute;
@end
