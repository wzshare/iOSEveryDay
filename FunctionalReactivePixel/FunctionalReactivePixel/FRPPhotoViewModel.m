//
//  FRPPhotoViewModel.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPPhotoViewModel.h"
#import <libextobjc/EXTScope.h>
#import "FRPPhotoImporter.h"

@implementation FRPPhotoViewModel

- (instancetype)initWithModel:(FRPPhotoModel *)photoModel {
    self = [super initWithModel:photoModel];
    if (!self) return nil;
    
    @weakify(self);
    [self.didBecomeActiveSignal subscribeNext:^(id x) {
        @strongify(self);
        [self downloadPhotoModelDetails];
    }];
    
    RAC(self, photoImage) = [RACObserve(self.model, fullsizedData) map:^id(id value) {
        return [UIImage imageWithData:value];
    }];
    
    return self;
}

- (NSString *)photoName {
    return self.model.photoName;
}

- (void)downloadPhotoModelDetails {
    self.loading = YES;
    
    @weakify(self);
    [[FRPPhotoImporter fetchPhotoDetails:self.model] subscribeError:^(NSError *error) {
        NSLog(@"Could not fetch photo details: %@", error);
    } completed:^{
        @strongify(self);
        self.loading = NO;
        NSLog(@"Fetched photo details.");
    }];
}

@end
