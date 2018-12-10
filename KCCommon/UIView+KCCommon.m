//
//  UIView+KCCommon.m
//  800Fang
//
//  Created by Erica on 2018/11/24.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "UIView+KCCommon.h"
#import <objc/runtime.h>

@implementation UIView (KCCommon)

/**************EmptyView*****************/
- (KCEmptyView *)kc_emptyView
{
    KCEmptyView *emptyView = objc_getAssociatedObject(self, _cmd);
    
    if (!emptyView) {
        
        emptyView = [KCEmptyView emptyView];
        
        objc_setAssociatedObject(self, _cmd, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return emptyView;
    
}


/**************KCToastView*****************/
- (KCToastView *)kc_toastView
{
    
    KCToastView *toastView = objc_getAssociatedObject(self, _cmd);
    
    if (!toastView) {
        
        toastView = [KCToastView toastView];
        
        objc_setAssociatedObject(self, _cmd, toastView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return toastView;
    
}

- (void)kc_showSuccessToast:(NSString *)text
{
    self.kc_toastView.text = text;
    self.kc_toastView.style = KCToastViewStyleSuccess;
    [self.kc_toastView showInView:self];
}
- (void)kc_showErrorToast:(NSString *)text
{
    
    self.kc_toastView.text = text;
    self.kc_toastView.style = KCToastViewStyleError;
    [self.kc_toastView showInView:self];
}
- (void)kc_showLoadingToast:(NSString *)text
{
    
    self.kc_toastView.text = text;
    self.kc_toastView.style = KCToastViewStyleLoading;
    [self.kc_toastView showInView:self];
}
- (void)kc_showInfoToast:(NSString *)text
{
    
    self.kc_toastView.text = text;
    self.kc_toastView.style = KCToastViewStyleInfo;
    [self.kc_toastView showInView:self];
}
- (void)kc_showProgressToast:(float)progress text:(NSString *)text
{
    
    self.kc_toastView.text = text;
    self.kc_toastView.style = KCToastViewStyleProgress;
    self.kc_toastView.progress = progress;
    [self.kc_toastView showInView:self];
}
- (void)kc_hideToast
{
    [self.kc_toastView dismiss];
}


- (void)kc_showEmptyState:(NSString *)title desc:(NSString *)desc image:(UIImage *)image refreshTitle:(NSString *)rt
{
    self.kc_emptyView.title = title;
    self.kc_emptyView.desc = desc;
    self.kc_emptyView.image = image;
    self.kc_emptyView.refreshTitle = rt;
    [self.kc_emptyView showInView:self];
}

- (void)kc_hideEmptyState
{
    [self.kc_emptyView dismiss];
}


@end
