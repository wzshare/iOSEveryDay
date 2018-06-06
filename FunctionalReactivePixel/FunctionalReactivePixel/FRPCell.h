//
//  FRPCell.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRPPhotoModel.h"

@interface FRPCell : UICollectionViewCell
- (void)updatePhotoModel:(FRPPhotoModel *)photoModel;
@end
