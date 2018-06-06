//
//  FRPPhotoImporter.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPPhotoImporter.h"
#import "FRPPhotoModel.h"
#import <500px-iOS-api/PXAPI.h>

@implementation FRPPhotoImporter

+ (RACSignal *)importPhotos {
    RACReplaySubject *subject = [RACReplaySubject subject];
    NSURLRequest *request = [self popularURLRequest];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data) {
            id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [subject sendNext:[[[results[@"photos"] rac_sequence] map:^id(NSDictionary *photoDictionary) {
                FRPPhotoModel *model = [[FRPPhotoModel alloc] init];
                
                //configure
                [self configurePhotoModel:model withDictionary:photoDictionary];
                
                //download
                [self downloadThumbnailForPhotoModel:model];
                
                return model;
            }] array]];
            [subject sendCompleted];
        }
        else {
            [subject sendError:connectionError];
        }
    }];
    return subject;
}

//500px popular api
+ (NSURLRequest *)popularURLRequest {
    return [[PXRequest apiHelper] urlRequestForPhotoFeature:PXAPIHelperPhotoFeaturePopular
                                             resultsPerPage:20 page:0
                                                  photoSizes:PXPhotoModelSizeThumbnail
                                                  sortOrder:PXAPIHelperSortOrderRating
                                                     except:PXPhotoModelCategoryNude];
}

+ (void)configurePhotoModel:(FRPPhotoModel *)photomodel withDictionary:(NSDictionary *)dictionary{
    //Basic details fetched with the first, basic request
    photomodel.photoName = dictionary[@"name"];
    photomodel.identifier = dictionary[@"id"];
    photomodel.photographerName = dictionary[@"user"][@"username"];
    photomodel.rating = dictionary[@"rating"];
    
    photomodel.thumbnailURL = [self urlForImageSize:3 inArray:dictionary[@"images"]];
    
    //Extended attributes fetched with subsequent request
    if (dictionary[@"comments_count"]){
        photomodel.fullsizedURL = [self urlForImageSize:4 inArray:dictionary[@"images"]];
    }
}

+ (NSString *)urlForImageSize:(NSInteger)size inArray:(NSArray *)array {
    return [[[[[array rac_sequence] filter:^BOOL(NSDictionary *value) {
        return [value[@"size"] integerValue] == size;
    }] map:^id(id value) {
        return value[@"url"];
    }] array] firstObject];
}

+ (void)downloadThumbnailForPhotoModel:(FRPPhotoModel *)photoModel {
    NSAssert(photoModel.thumbnailURL, @"photo url must not be nil.");
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:photoModel.thumbnailURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError * connectionError){
                               photoModel.thumbnailData = data;
                           }];
}

@end
