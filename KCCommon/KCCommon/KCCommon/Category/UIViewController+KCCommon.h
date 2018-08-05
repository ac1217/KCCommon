//
//  UIViewController+KCCommon.h
//  KCCommon
//
//  Created by Erica on 2018/8/1.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCNavigationView.h"

@interface UIViewController (KCCommon)<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

// TableView  获取TableView前需要设置style
@property (nonatomic,assign) UITableViewStyle kc_tableViewStyle;
@property (nonatomic,strong, readonly) UITableView *kc_tableView;

// ScrollView
@property (nonatomic,strong, readonly) UIScrollView *kc_scrollView;

// CollectionView  获取CollectionView前需要设置layout
@property (nonatomic,strong) UICollectionViewLayout *kc_collectionViewLayout;
@property (nonatomic,strong, readonly) UICollectionView *kc_collectionView;

// NavigationView  导航条
@property (nonatomic,strong, readonly) KCNavigationView *kc_navigationView;

// ContentView 建议所有子控件添加到contentView上
@property (nonatomic,strong, readonly) UIView *kc_contentView;

@end
