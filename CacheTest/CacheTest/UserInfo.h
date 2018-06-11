//
//  UserInfo.h
//  CacheTest
//
//  Created by wangzhe on 2018/6/11.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StudentInfo;
@interface UserInfo : NSObject <NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int age;
@property(nonatomic, strong) StudentInfo *student;

+ (instancetype)shareInstance;

@end


@interface StudentInfo : NSObject <NSCoding>
@property(nonatomic, assign) int identify;
@property(nonatomic, strong) NSArray *cities;
@end
