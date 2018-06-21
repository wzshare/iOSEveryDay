//
//  GCDBarrier.h
//  test
//
//  Created by wangzhe on 2018/6/21.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDBarrier : NSObject

- (void)barrierAsync;
- (void)barrierSync;

@end
