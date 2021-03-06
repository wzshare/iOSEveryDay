//
//  FRPPhotoImporter.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FRPPhotoModel.h"

@interface FRPPhotoImporter : NSObject

+ (RACSignal *)importPhotos;
+ (RACReplaySubject *)fetchPhotoDetails:(FRPPhotoModel *)photoModel;

@end
