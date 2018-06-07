//
//  FRPPhotoModel.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPPhotoModel : NSObject

@property (nonatomic, strong) NSString *photoName;
@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *photographerName;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *thumbnailURL;
@property (nonatomic, strong) NSData *thumbnailData;
@property (nonatomic, strong) NSString *fullsizedURL;
@property (nonatomic, strong) NSData *fullsizedData;
@property (nonatomic, assign, getter = isVotedFor) BOOL votedFor;

@end
