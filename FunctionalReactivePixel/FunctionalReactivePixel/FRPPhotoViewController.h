//
//  FRPPhotoViewController.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRPPhotoViewModel.h"

@interface FRPPhotoViewController : UIViewController

- (instancetype)initWithViewModel:(FRPPhotoViewModel *)viewModel index:(NSInteger)photoIndex;

@property (nonatomic, assign) NSInteger photoIndex;
@property (nonatomic, strong) FRPPhotoViewModel *viewModel;

@end
