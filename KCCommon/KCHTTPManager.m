//
//  KCNetworkManager.m
//  KCPlayerDemo
//
//  Created by zhangweiwei on 2017/6/17.
//  Copyright © 2017年 erica. All rights reserved.
//

#import "KCHTTPManager.h"

@interface KCHTTPManager()

@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

@end

@implementation KCHTTPManager

+ (instancetype)sharedInstance
{
    static id instane_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instane_ = [[self alloc] init];
    });
    return instane_;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      headers:(NSDictionary *)headers
                     progress:(void (^)(float))progress
                   completion:(void (^)(id, NSError *))completion
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (completion) {
            completion(nil, serializationError);
        }
        
        return nil;
    }
    
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [request setValue:obj forHTTPHeaderField:key];
        
    }];
    
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!progress) return;
            
            CGFloat currentProgress = downloadProgress.completedUnitCount / (double)downloadProgress.totalUnitCount;
            
            progress(currentProgress);
        });
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        completion(responseObject, error);
    }];
    [task resume];
    return task;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     progress:(void (^)(float))progress
                   completion:(void (^)(id, NSError *))completion
{
    return [self GET:URLString parameters:parameters headers:nil progress:progress completion:completion];
    
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       headers:(NSDictionary *)headers
                      progress:(void (^)(float))progress
                    completion:(void (^)(id, NSError *))completion {
    
    
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (completion) {
            completion(nil, serializationError);
        }
        
        return nil;
    }
    
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [request setValue:obj forHTTPHeaderField:key];
        
    }];
    
    
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!progress) return;
            
            CGFloat currentProgress = downloadProgress.completedUnitCount / (double)downloadProgress.totalUnitCount;
            
            progress(currentProgress);
        });
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        completion(responseObject, error);
    }];
    
    [task resume];
    
    return task;
    
}


- (NSURLSessionDownloadTask *)download:(NSString *)URLString
                            targetPath:(NSString *)targetPath
                              progress:(void (^)(float))progress
                            completion:(void (^)(id, NSError *))completion
{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    NSURLSessionDownloadTask *downloadTask = [self.sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!progress) return;
            
            CGFloat currentProgress = downloadProgress.completedUnitCount / (double)downloadProgress.totalUnitCount;
            
            progress(currentProgress);
            
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull tp, NSURLResponse * _Nonnull response) {
        
        return [NSURL fileURLWithPath:targetPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            
            !completion ? : completion(nil, error);
        }else {
            
            !completion ? : completion(filePath.absoluteString, error);
        }
        
    }];
    
    
    
    [downloadTask resume];
    
    return downloadTask;
}

- (NSURLSessionUploadTask *)upload:(NSString *)URLString
                           headers:(NSDictionary *)headers
                              data:(NSData *)data
                          progress:(void (^)(float))progress
                        completion:(void (^)(id, NSError *))completion
{
    
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:nil error:&serializationError];
    if (serializationError) {
        if (completion) {
            completion(nil, serializationError);
        }
        
        return nil;
    }
    
    
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [request setValue:obj forHTTPHeaderField:key];
        
    }];
    
    [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionUploadTask *uploadTask = [self.sessionManager uploadTaskWithRequest:request fromData:data progress:^(NSProgress * _Nonnull uploadProgress) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!progress) return;
            
            CGFloat currentProgress = uploadProgress.completedUnitCount / (double)uploadProgress.totalUnitCount;
            
            progress(currentProgress);
            
        });
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            
            !completion ? : completion(nil, error);
            
        }else {
            
            !completion ? : completion(responseObject, nil);
        }
        
    }];
    
    [uploadTask resume];
    
    return uploadTask;
}

- (NSURLSessionUploadTask *)upload:(NSString *)URLString
                              data:(NSData *)data
                          progress:(void (^)(float))progress
                        completion:(void (^)(id, NSError *))completion
{
    
    return [self upload:URLString headers:nil data:data progress:progress completion:completion];
    
}

#pragma mark -Private Method
- (void)__appendDefaultHeaders
{
    if (!self.defaultHeaders) {
        return;
    }
    
}

- (void)__appendDefaultParameters
{
    if (!self.defaultParameters) {
        return;
    }
    
}

#pragma mark -Getter
- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager) {
        
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain", nil];
        responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 500)];
        
        [_sessionManager setResponseSerializer:responseSerializer];
        
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        requestSerializer.timeoutInterval = 15;
//        requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        [_sessionManager setRequestSerializer:requestSerializer];
        
        
    }
    return _sessionManager;
}

@end

