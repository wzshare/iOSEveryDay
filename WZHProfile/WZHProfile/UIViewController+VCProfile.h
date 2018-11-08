//
//  UIViewController+VCProfile.h
//  WZHProfile
//
//  Created by wangzhe on 2018/10/12.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTHFakeKVOObserver : NSObject
@end

@interface MTHFakeKVORemover : NSObject

@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic, copy) NSString *keyPath;

@end

@interface UIViewController (VCProfile)

@end

NS_ASSUME_NONNULL_END
