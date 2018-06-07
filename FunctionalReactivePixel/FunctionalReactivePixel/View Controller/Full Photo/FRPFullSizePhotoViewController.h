//
//  FRPFullSizePhotoViewController.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRPFullSizePhotoViewModel.h"

@class FRPFullSizePhotoViewController;
@protocol FRPFullSizePhotoViewControllerDelegate <NSObject>
- (void)userDidScroll:(FRPFullSizePhotoViewController *)viewController toPhotoAtIndex:(NSInteger)index;

@end

@interface FRPFullSizePhotoViewController : UIViewController

@property (nonatomic ,strong) FRPFullSizePhotoViewModel *viewModel;
@property (nonatomic, weak) id<FRPFullSizePhotoViewControllerDelegate> delegate;

@end
