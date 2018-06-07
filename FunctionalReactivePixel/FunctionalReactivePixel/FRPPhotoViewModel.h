//
//  FRPPhotoViewModel.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveViewModel/ReactiveViewModel.h>
#import "FRPPhotoModel.h"

@interface FRPPhotoViewModel : RVMViewModel

@property (nonatomic, strong) FRPPhotoModel *model;
@property (nonatomic, readonly) UIImage *photoImage;
@property (nonatomic, readonly, getter = isLoading) BOOL loading;

- (NSString *)photoName;

@end
