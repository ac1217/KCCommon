//
//  KSNetworkTool.h
//  KCPlayerDemo
//
//  Created by zhangweiwei on 2017/6/17.
//  Copyright © 2017年 erica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface KCHTTPManager : NSObject

+ (instancetype)sharedInstance;


@property (nonatomic,strong) NSURL *baseURL;
@property (nonatomic,strong) NSDictionary *defaultParameters;
@property (nonatomic,strong) NSDictionary *defaultHeaders;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                   headers:(NSDictionary *)headers
                     progress:(void (^)(float))progress
                   completion:(void (^)(id, NSError *))completion;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       headers:(NSDictionary *)headers
                      progress:(void (^)(float))progress
                    completion:(void (^)(id, NSError *))completion;

- (NSURLSessionDownloadTask *)download:(NSString *)URLString
                            targetPath:(NSString *)targetPath
                              progress:(void (^)(float))progress
                            completion:(void (^)(id, NSError *))completion;

- (NSURLSessionUploadTask *)upload:(NSString *)URLString
                              data:(NSData *)data
                          progress:(void (^)(float))progress
                        completion:(void (^)(id, NSError *))completion;

- (NSURLSessionUploadTask *)upload:(NSString *)URLString
                           headers:(NSDictionary *)headers
                              data:(NSData *)data
                          progress:(void (^)(float))progress
                        completion:(void (^)(id, NSError *))completion;

@end
