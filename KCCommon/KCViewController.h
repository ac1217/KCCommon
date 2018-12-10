//
//  KCCommonViewController.h
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCViewController : UIViewController

// NavigationView  导航条
@property (nonatomic,strong, readonly) KCNavigationView *navigationView;

// ContentView 建议所有子控件添加到contentView上
@property (nonatomic,strong, readonly) UIView *contentView;

// 重写必须调用super;
- (void)setupUI;
- (void)setupLayout;




@end

NS_ASSUME_NONNULL_END
