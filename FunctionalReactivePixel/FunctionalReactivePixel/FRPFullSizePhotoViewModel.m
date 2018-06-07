//
//  FRPFullSizePhotoViewModel.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPFullSizePhotoViewModel.h"

@implementation FRPFullSizePhotoViewModel

- (instancetype)initWithPhotoArray:(NSArray *)photoArray initialPhotoIndex:(NSInteger)initialPhotoIndex {
    self = [self initWithModel:photoArray];
    if (self) {
        self.initialPhotoIndex = initialPhotoIndex;
    }
    return self;
}

- (NSString *)initialPhotoName {
    FRPPhotoModel *photoModel = [self initialPhotoModel];
    return [photoModel photoName];
}

- (FRPPhotoModel *)photoModelAtIndex:(NSInteger)index {
    if (index < 0 || index > self.model.count - 1) {
        // Index was out of bounds, return nil
        return nil;
    } else {
        return self.model[index];
    }
}

- (FRPPhotoModel *)initialPhotoModel {
    return [self photoModelAtIndex:self.initialPhotoIndex];
}

@end
