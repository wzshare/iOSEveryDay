//
//  DecoratorClient.m
//  DesignPattern
//
//  Created by wangzhe on 2018/8/27.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "DecoratorClient.h"
#import "Car.h"
#import "Robot.h"
#import "AirPlane.h"

@implementation DecoratorClient
- (void)pattern {
    Car *car = [Car new];
    [car move];

    Transform *pA = [[Robot alloc] initWithDecorator:car];
    [pA move];
    
    Transform *pB = [[AirPlane alloc] initWithDecorator:car];
    [pB move];
}
@end
