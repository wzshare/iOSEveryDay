//
//  AdapterClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "AdapterClient.h"
#import "Adapter.h"
#import "Adaptee.h"

@implementation AdapterClient
- (void)pattern {
    Adaptee *adaptee  = [Adaptee new];
    Target * tar = [[Adapter alloc] initWithAdaptee:adaptee];
    [tar request];
}
@end
