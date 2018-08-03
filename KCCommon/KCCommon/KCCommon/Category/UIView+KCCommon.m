//
//  UIView+KCCommon.m
//  KCCommon
//
//  Created by Erica on 2018/8/2.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import "UIView+KCCommon.h"
#import <objc/runtime.h>

@implementation UIView (KCCommon)

- (KCAlertView *)kc_alertView
{
    
    KCAlertView *alertView = objc_getAssociatedObject(self, _cmd);
    
    if (!alertView) {
        
        alertView = [KCAlertView alertView];
        
        objc_setAssociatedObject(self, _cmd, alertView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return alertView;
    
}

- (KCToastView *)kc_toastView
{
    
    KCToastView *toastView = objc_getAssociatedObject(self, _cmd);
    
    if (!toastView) {
        
        toastView = [KCToastView toastView];
        
        objc_setAssociatedObject(self, _cmd, toastView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return toastView;
    
}

- (KCEmptyView *)kc_emptyView
{
    
    KCEmptyView *emptyView = objc_getAssociatedObject(self, _cmd);
    
    if (!emptyView) {
        
        emptyView = [KCEmptyView emptyView];
    
        objc_setAssociatedObject(self, _cmd, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return emptyView;
    
}

- (void)kc_showEmptyView
{
    
    [self.kc_emptyView showInView:self];
}

- (void)kc_hideEmptyView
{
    [self.kc_emptyView dismiss];
}

- (void)kc_showToastView
{
    
    [self.kc_toastView showInView:self];
}

- (void)kc_hideToastView
{
    
    [self.kc_toastView dismiss];
}


- (void)kc_showAlertView
{
    
    [self.kc_alertView showInView:self];
}
- (void)kc_hideAlertView
{
    
    [self.kc_alertView dismiss];
}

/*
- (void)kc_showSuccessToastView:(NSString *)text
{
    self.kc_toastView.style = KCToastViewStyleSuccess;
    self.kc_toastView.text = text;
    self.kc_toastView.duration = 3;
//    self.kc_toastView.position = KCToastViewPositionBottom;
    [self.kc_toastView showInView:self];
}

- (void)kc_showErrorToastView:(NSString *)text
{
    self.kc_toastView.style = KCToastViewStyleError;
    self.kc_toastView.text = text;
    self.kc_toastView.duration = 3;
    
    [self.kc_toastView showInView:self];
}

- (void)kc_showInfoToastView:(NSString *)text
{
    self.kc_toastView.style = KCToastViewStyleInfo;
    self.kc_toastView.text = text;
    self.kc_toastView.duration = 3;
    
    [self.kc_toastView showInView:self];
}

- (void)kc_showProgressToastView:(float)progress text:(NSString *)text
{
    self.kc_toastView.style = KCToastViewStyleProgress;
    self.kc_toastView.text = text;
    self.kc_toastView.progress = progress;
    self.kc_toastView.maskType = KCToastViewMaskTypeClear;
    self.kc_toastView.duration = 0;
    self.kc_toastView.layoutDirection = KCToastViewLayoutDirectionVertical;
    [self.kc_toastView showInView:self];
}
- (void)kc_showLoadingToastView:(NSString *)text
{
    
    self.kc_toastView.style = KCToastViewStyleLoading;
    self.kc_toastView.text = text;
    self.kc_toastView.maskType = KCToastViewMaskTypeClear;
    self.kc_toastView.duration = 0;
    
//   NSArray *arr = [[NSArray alloc]initWithObjects:
//     [UIImage imageNamed:@"musicm_top_loading_inr01"],
//     [UIImage imageNamed:@"musicm_top_loading_inr02"],
//     [UIImage imageNamed:@"musicm_top_loading_inr03"],
//     [UIImage imageNamed:@"musicm_top_loading_inr04"],
//     [UIImage imageNamed:@"musicm_top_loading_inr05"],
//     [UIImage imageNamed:@"musicm_top_loading_inr06"],
//     [UIImage imageNamed:@"musicm_top_loading_inr07"],
//     [UIImage imageNamed:@"musicm_top_loading_inr08"],
//     [UIImage imageNamed:@"musicm_top_loading_inr09"],
//     [UIImage imageNamed:@"musicm_top_loading_inr10"],
//     [UIImage imageNamed:@"musicm_top_loading_inr11"],
//     [UIImage imageNamed:@"musicm_top_loading_inr12"],
//     [UIImage imageNamed:@"musicm_top_loading_inr13"],nil];
//    self.kc_toastView.loadingType = KCToastViewLoadingTypeGif;
//    self.kc_toastView.loadingImages = arr;
//    self.kc_toastView.layoutDirection = KCToastViewLayoutDirectionVertical;
    
    [self.kc_toastView showInView:self];
}

- (void)kc_hideToastView
{
    [self.kc_toastView dismiss];
}*/

@end
