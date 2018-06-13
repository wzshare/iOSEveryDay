//
//  BlockView.h
//  BlockTest
//
//  Created by wangzhe on 2018/6/13.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView
- (void)blockView:(void(^)(id result))block;
@end
