//
//  main.m
//  SuperClassTest
//
//  Created by wangzhe on 2018/10/9.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Son.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Son *son = [Son new];
        [son ouputClass];
    }
    return 0;
}
