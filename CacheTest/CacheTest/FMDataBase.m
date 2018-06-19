//
//  FMDataBase.m
//  CacheTest
//
//  Created by wangzhe on 2018/6/19.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FMDataBase.h"
#import <FMDB/FMDB.h>

@implementation FMDataBase

- (void)createDB {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"mydatabase.db"];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    if (![db open]) {
        NSLog(@"Could not open db.");
        return;
    }
    
    [db executeUpdate:@"CREATE TABLE PersonList(Name text, Age integer, Sex interget, Phone text, Address text)"];
    
    [db executeUpdate:@"INSERT INTO PersonList(Name, Age, Sex, Phone, Address) VALUES (?, ?, ?, ?, ?)", @"wzh", [NSNumber numberWithInteger:20], [NSNumber numberWithInteger:0], @"123456", @"beijing"];
}

@end
