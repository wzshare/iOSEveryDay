//
//  TestPrint.m
//  MakeFramework
//
//  Created by wangzhe on 2018/6/26.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "TestPrint.h"

@implementation TestPrint

- (void)printToday {
    NSLog(@"Today is %@", [NSDate date]);
}

- (void)printCalendar {
    // 当前时间对应的月份中有几天
    NSUInteger days = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]].length;
    NSLog(@"当前时间对应的月份中有 %ld 天", days);
    
    // 当前时间对应的月份中有几周
    NSUInteger weeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:[NSDate date]].length;
    NSLog(@"当前时间对应的月份中有 %ld 周", weeks);
    
    // 当前时间对应的周是当前年中的第几周
    NSUInteger weekOfYear = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    NSLog(@"当前时间对应的周是当前年中的第 %ld 周", weekOfYear);
    
    // 当前时间对应的周是当前月中的第几周
    NSUInteger weekOfMonth = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSLog(@"当前时间对应的周是当前月中的第 %ld 周", weekOfMonth);
}

@end
