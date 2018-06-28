//
//  CATAutoDictionary.h
//  CacheTest
//
//  Created by wangzhe on 2018/6/28.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CATAutoDictionary : NSObject

/**
 dynamic method resolution 动态方法解析
 编写一个类似于NSDictionary的类，里面可以容纳其他对象，但是可以直接通过
 属性来存取其中的数据。
 思路：由开发者来添加属性定义，并将其声明为@dynamic，类会自动处理相关属性
 值的setter和getter操作。
 */

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;

@end
