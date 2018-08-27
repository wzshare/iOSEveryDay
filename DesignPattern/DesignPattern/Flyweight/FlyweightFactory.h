//
//  FlyweightFactory.h
//  DesignPattern
//
//  Created by 王哲 on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flyweight.h"

@interface FlyweightFactory : NSObject
- (Flyweight *)getFlyweight:(NSString *)weight;
@end
