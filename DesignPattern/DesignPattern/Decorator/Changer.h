//
//  Changer.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "Transform.h"

@interface Changer : Transform
- (instancetype)initWithDecorator:(Transform *)transform;
@end
