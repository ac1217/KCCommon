//
//  KCAppManager.h
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCAppManager : NSObject

+ (instancetype)sharedInstance;


- (void)requestLocationWithCompletion:(void(^)(NSArray <CLPlacemark *>*placemarks, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
