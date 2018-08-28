//
//  FacadeClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FacadeClient.h"
#import "Facade.h"

@implementation FacadeClient
- (void)pattern {
    Facade *mFacade = [Facade new];
    [mFacade wrapOpration];
}
@end
