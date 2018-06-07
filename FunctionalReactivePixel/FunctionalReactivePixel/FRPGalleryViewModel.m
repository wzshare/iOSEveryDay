//
//  FRPGalleryViewModel.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPGalleryViewModel.h"
#import "FRPPhotoImporter.h"

@implementation FRPGalleryViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        RAC(self, model) = [self importPhotosSignal];
    }
    return self;
}

-(RACSignal *)importPhotosSignal {
    return [[[FRPPhotoImporter importPhotos] logError] catchTo:[RACSignal empty]];
}

@end
