//
//  KCAppManager.m
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCAppManager.h"

@interface KCAppManager()<CLLocationManagerDelegate>

@property (nonatomic,copy) void(^locationBlock)(NSArray <CLPlacemark *>*placemarks, NSError *error);

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation KCAppManager

+ (instancetype)sharedInstance
{
    static id instane_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instane_ = [[self alloc] init];
    });
    return instane_;
}


- (void)requestLocationWithCompletion:(void(^)(NSArray <CLPlacemark *>*placemarks, NSError *error))completion
{
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (![CLLocationManager locationServicesEnabled]) {
        
        NSError *error = [NSError errorWithDomain:@"KCCommon" code:10001 userInfo:@{NSLocalizedFailureReasonErrorKey: @"定位服务不可用，请前往设置开启定位服务"}];
        
        !completion ? : completion(nil, error);
        
        return;
    }
    
    
    switch (status) {
            case kCLAuthorizationStatusDenied:
        {
            
            NSError *error = [NSError errorWithDomain:@"KCCommon" code:10002 userInfo:@{NSLocalizedFailureReasonErrorKey: @"用户拒绝使用定位服务"}];
            
            !completion ? : completion(nil, error);
        }
            break;
            case kCLAuthorizationStatusRestricted:
        {
            
            NSError *error = [NSError errorWithDomain:@"KCCommon" code:10003 userInfo:@{NSLocalizedFailureReasonErrorKey: @"定位服务受限制"}];
            
            !completion ? : completion(nil, error);
        }
            break;
            case kCLAuthorizationStatusAuthorizedAlways:
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            case kCLAuthorizationStatusNotDetermined:
        {
            self.locationBlock = completion;
            [self.locationManager requestLocation];
            
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark -CLLocationManagerDelegate
//定位成功以后调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    [manager stopUpdatingLocation];
    CLLocation* location = locations.lastObject;
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(error){
            
            !self.locationBlock ? : self.locationBlock(nil, error);
            
        }else {
            
            !self.locationBlock ? : self.locationBlock(placemarks, nil);
            
        }
        self.locationBlock = nil;
        
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    !self.locationBlock ? : self.locationBlock(nil,error);
    self.locationBlock = nil;
}


- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager requestAlwaysAuthorization];
        
        //设置定位精度
//        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置距离筛选
//        [_locationManager setDistanceFilter:100];
    }
    return _locationManager;
}


@end
