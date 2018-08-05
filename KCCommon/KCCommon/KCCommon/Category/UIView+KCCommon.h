//
//  UIView+KCCommon.h
//  KCCommon
//
//  Created by Erica on 2018/8/2.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCEmptyView.h"
#import "KCToastView.h"
#import "KCAlertView.h"

@interface UIView (KCCommon)

// 一个view对应一个
@property (nonatomic,strong,readonly) KCEmptyView *kc_emptyView;
@property (nonatomic,strong,readonly) KCToastView *kc_toastView;
@property (nonatomic,strong,readonly) KCAlertView *kc_alertView;


// 使用方法项目具体定义
/*
- (void)kc_showSuccessToastView:(NSString *)text;
- (void)kc_showErrorToastView:(NSString *)text;
- (void)kc_showLoadingToastView:(NSString *)text;
- (void)kc_showInfoToastView:(NSString *)text;
- (void)kc_showProgressToastView:(float)progress text:(NSString *)text;
- (void)kc_hideToastView;*/

@end
