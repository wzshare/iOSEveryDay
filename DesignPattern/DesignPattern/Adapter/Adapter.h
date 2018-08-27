//
//  Adapter.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Target.h"
#import "Adaptee.h"

@interface Adapter : Target
- (instancetype)initWithAdaptee:(Adaptee *)adaptee;
@end
