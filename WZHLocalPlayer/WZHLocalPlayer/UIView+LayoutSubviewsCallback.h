//
//  UIView+LayoutSubviewsCallback.h
//  WZHLocalPlayer
//
//  Created by wangzhe on 2018/11/6.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LayoutSubviewsCallback)
@property (assign) void (^layoutSubviewsCallback)(UIView *);
@end

NS_ASSUME_NONNULL_END
