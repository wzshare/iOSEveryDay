//
//  Abstraction.h
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Implementor.h"

@interface Abstraction : NSObject
@property (nonatomic, strong) Implementor *mImp;
- (instancetype)initWithImplementor:(Implementor *)imp;
- (void)operation;
@end
