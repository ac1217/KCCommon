//
//  UIViewController+KCCommon.h
//  KCCommon
//
//  Created by Erica on 2018/8/1.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCComponent.h"

@interface UIViewController (KCCommon)<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

// TableView
@property (nonatomic,assign) UITableViewStyle kc_tableViewStyle;
@property (nonatomic,strong, readonly) UITableView *kc_tableView;

// ScrollView
@property (nonatomic,strong, readonly) UIScrollView *kc_scrollView;

// CollectionView
@property (nonatomic,strong) UICollectionViewLayout *kc_collectionViewLayout;
@property (nonatomic,strong, readonly) UICollectionView *kc_collectionView;

// NavigationView
@property (nonatomic,strong, readonly) KCNavigationView *kc_navigationView;

// ContentView
@property (nonatomic,strong, readonly) UIView *kc_contentView;

@end
