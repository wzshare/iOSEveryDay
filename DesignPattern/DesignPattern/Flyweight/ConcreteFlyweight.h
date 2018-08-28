//
//  ConcreteFlyweight.h
//  DesignPattern
//
//  Created by 王哲 on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Flyweight.h"

@interface ConcreteFlyweight : Flyweight
- (instancetype)initWithState:(NSString *)state;
@end
