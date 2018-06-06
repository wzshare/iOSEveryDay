//
//  AppDelegate.h
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "FRPGalleryViewController.h"
#import <500px-iOS-api/PXAPI.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) PXAPIHelper *apiHelper;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

