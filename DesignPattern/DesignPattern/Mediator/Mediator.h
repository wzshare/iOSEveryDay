//
//  Mediator.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Colleague;
@interface Mediator : NSObject
- (void)operation:(int)index message:(NSString *)msg;
- (void)registered:(int)index colleague:(Colleague *)col;
@end
