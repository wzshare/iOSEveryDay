//
//  LoopTableViewInterceptor.h
//  LoopTableView
//
//  Created by wangzhe on 2018/10/10.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoopTableViewInterceptor : NSObject
@property (nonatomic, weak) id reciver;
@property (nonatomic, weak) id middler;
@end

NS_ASSUME_NONNULL_END
