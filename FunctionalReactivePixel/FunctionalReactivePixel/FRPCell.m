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
@property (nonatomic , weak ) UIImageView * imageView;
@property (nonatomic , strong ) RACDisposable *subscription;

@end

@implementation FRPCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}

- (void)updatePhotoModel:(FRPPhotoModel *)photoModel
{
    self.subscription = [[[RACObserve(photoModel, thumbnailData) filter:^BOOL(id value) {
        return value != nil;
    }] map:^id(id value) {
        return [UIImage imageWithData:value];
    }] setKeyPath:@keypath(self.imageView, image) onObject:self.imageView];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [_subscription dispose], _subscription = nil;
}

@end
