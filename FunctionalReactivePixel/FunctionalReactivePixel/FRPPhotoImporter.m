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
    NSURLRequest *request = [self popularURLRequest];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response , NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(NSData *data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        return [[[results[@"photo"] rac_sequence]
                 map:^id (NSDictionary *photoDictionary) {
                     FRPPhotoModel *model = [FRPPhotoModel new];
                     [self configurePhotoModel:model withDictionary:photoDictionary];
                     [self downloadThumbnailForPhotoModel:model];
                     return model;
                 }] array];
    }] publish] autoconnect];
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

+ (RACSignal *)fetchPhotoDetails:(FRPPhotoModel *)photoModel {
    
    NSURLRequest *request = [self photoURLRequest:photoModel];
    
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data) {
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(NSData *data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil][@"photo"];
        [self configurePhotoModel:photoModel withDictionary:results];
        [self downloadFullsizedImageForPhotoModel:photoModel];
        return photoModel;
    }] publish] autoconnect];
}

+ (NSURLRequest *)photoURLRequest:(FRPPhotoModel *)photoModel{
    return [[PXRequest apiHelper] urlRequestForPhotoID:photoModel.identifier.integerValue];
}

+ (void)downloadThumbnailForPhotoModel:(FRPPhotoModel *)photoModel {
    RAC(photoModel, thumbnailData) = [self download:photoModel.thumbnailURL];
}

+ (void)downloadFullsizedImageForPhotoModel:(FRPPhotoModel *)photoModel {
    RAC(photoModel, fullsizedData) = [self download:photoModel.fullsizedURL];
}

+ (RACSignal *)download:(NSString *)urlString {
    NSAssert(urlString, @"URL must not be nil" );
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    return [[[NSURLConnection rac_sendAsynchronousRequest:request] map:^id(RACTuple *value) {
        return [value second];
    }] deliverOn:[RACScheduler mainThreadScheduler]];
}

@end
