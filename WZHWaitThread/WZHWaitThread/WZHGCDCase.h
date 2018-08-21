//
//  WZHGCDCase.h
//  WZHWaitThread
//
//  Created by wangzhe on 2018/8/16.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZHGCDCase : NSObject
- (void)waitThreadWithSemaphore;
- (void)waitThreadWithBarrier;
- (void)waitThreadWithGroup;
@end
