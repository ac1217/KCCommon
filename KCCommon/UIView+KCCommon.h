//
//  UIView+KCCommon.h
//  800Fang
//
//  Created by Erica on 2018/11/24.
//  Copyright © 2018 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KCCommon)


// EmptyView  空view
@property (nonatomic,strong, readonly) KCEmptyView *kc_emptyView;


// ToastView  吐司
@property (nonatomic,strong,readonly) KCToastView *kc_toastView;

- (void)kc_showSuccessToast:(NSString *)text;
- (void)kc_showErrorToast:(NSString *)text;
- (void)kc_showLoadingToast:(NSString *)text;
- (void)kc_showInfoToast:(NSString *)text;
- (void)kc_showProgressToast:(float)progress text:(NSString *)text;
- (void)kc_hideToast;

- (void)kc_showEmptyState:(NSString *)title desc:(NSString *)desc image:(UIImage *)image refreshTitle:(NSString *)rt;
- (void)kc_hideEmptyState;

@end

NS_ASSUME_NONNULL_END
