//
//  UserInfo.m
//  CacheTest
//
//  Created by wangzhe on 2018/6/11.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (instancetype)shareInstance {
    static UserInfo *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[UserInfo alloc] init];
    });
    return instance;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.student forKey:@"info"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self.age = [aDecoder decodeIntForKey:@"age"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.student = [aDecoder decodeObjectForKey:@"info"];
    return self;
}

@end

@implementation StudentInfo

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeInt:self.identify forKey:@"identify"];
    [aCoder encodeObject:self.cities forKey:@"cities"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self.identify = [aDecoder decodeIntForKey:@"identify"];
    self.cities = [aDecoder decodeObjectForKey:@"cities"];
    return self;
}

@end
