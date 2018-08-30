//
//  State.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Context.h"

@interface State : NSObject
- (void)handle:(Context *)context;
@end
