//
//  Context.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class State;
@interface Context : NSObject
- (void)request;
- (void)changeState:(State *)state;
@end
