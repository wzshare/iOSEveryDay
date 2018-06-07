//
//  FRPFullSizePhotoViewModel.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>
#import "FRPPhotoModel.h"

@interface FRPFullSizePhotoViewModel : RVMViewModel
@property (nonatomic, strong) NSArray *model;
@property (nonatomic, assign) NSInteger initialPhotoIndex;
@property (nonatomic, strong) NSString *initialPhotoName;

- (instancetype)initWithPhotoArray:(NSArray *)photoArray initialPhotoIndex:(NSInteger)initialPhotoIndex;
- (FRPPhotoModel *)photoModelAtIndex:(NSInteger)index;
@end
