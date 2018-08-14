//
//  Color.h
//  KVOTest
//
//  Created by wangzhe on 2018/8/14.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KTColor) {
    KTColorRed = 0,
    KTColorYellow,
    KTColorGreen,
};

@interface Color : NSObject
@property (nonatomic, assign) KTColor color;
@end
