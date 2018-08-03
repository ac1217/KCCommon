//
//  KCAlertView.h
//  KCCommon
//
//  Created by Erica on 2018/8/3.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    KCAlertActionStyleDefault = 0,
    KCAlertActionStyleCancel,
    KCAlertActionStyleDestructive,
    KCAlertActionStyleCustom
} KCAlertActionStyle;

@interface KCAlertAction: NSObject

@property (nonatomic,assign) KCAlertActionStyle style;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIFont *titleFont;

@property (nonatomic,strong) NSAttributedString *attributedTitle;
@property (nonatomic,copy) void(^handler)(KCAlertAction *action);
@end

typedef enum : NSUInteger {
    KCAlertViewStyleAlert,
    KCAlertViewStyleActionSheet
} KCAlertViewStyle;

@interface KCAlertView : UIView


+ (instancetype)alertView;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *detail;

@property (nonatomic,strong) UIView *showView;

@property (nonatomic,strong) NSAttributedString *attributedTitle;
@property (nonatomic,strong) NSAttributedString *attributedDetail;

@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIFont *titleFont;
@property (nonatomic,strong) UIColor *detailColor;
@property (nonatomic,strong) UIFont *detailFont;

@property (nonatomic,assign) KCAlertViewStyle style;
@property (nonatomic,assign) BOOL actionDismiss;
@property (nonatomic,assign) BOOL backgroundDismiss;

@property (nonatomic,strong) NSArray <KCAlertAction *>*actions;

- (void)showInView:(UIView *)view;
- (void)dismiss;

@end
