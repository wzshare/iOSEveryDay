//
//  FRPGalleryFlowLayout.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPGalleryFlowLayout.h"

@implementation FRPGalleryFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        float itemWidth = ([UIScreen mainScreen].bounds.size.width - 30) / 2;
        self.itemSize = CGSizeMake(itemWidth, itemWidth);
        self.minimumInteritemSpacing = 10.0;
        self.minimumLineSpacing = 10.0;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

@end
