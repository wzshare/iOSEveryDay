//
//  FRPCell.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FRPCell ()
@property (nonatomic, weak) UIImageView * imageView;
@end

@implementation FRPCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        imageView.image = [UIImage imageNamed:@"500px_mark"];
        [self.contentView addSubview:imageView];
        self.imageView = imageView;
        
        RAC(self.imageView, image) = [[RACObserve(self, photoModel.thumbnailData) ignore:nil] map:^id(NSData *data) {
            return [UIImage imageWithData:data];
        }];
    }
    return self;
}

@end
