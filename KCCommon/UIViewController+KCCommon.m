//
//  UIViewController+KCCommon.m
//  KCCommon
//
//  Created by Erica on 2018/8/1.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import "UIViewController+KCCommon.h"
#import <objc/runtime.h>

//static NSString *const kc_tableViewStyleKey = @"kc_tableViewStyle";
//static NSString *const kc_collectionViewLayoutKey = @"kc_collectionViewLayout";

@implementation UIViewController (KCCommon)

- (void)setKc_collectionViewLayout:(UICollectionViewLayout *)kc_collectionViewLayout
{

    objc_setAssociatedObject(self, "kc_collectionViewLayout", kc_collectionViewLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
//    self.kc_collectionView.collectionViewLayout = kc_collectionViewLayout;
}

- (UICollectionViewLayout *)kc_collectionViewLayout
{
    UICollectionViewLayout *collectionViewLayout = objc_getAssociatedObject(self, "kc_collectionViewLayout");
    
    if (!collectionViewLayout) {
        collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        
        objc_setAssociatedObject(self, "kc_collectionViewLayout", collectionViewLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return collectionViewLayout;
    
}

- (UICollectionView *)kc_collectionView
{
    UICollectionView *collectionView = objc_getAssociatedObject(self, "kc_collectionView");
    
    if (!collectionView) {
        
        collectionView = [[UICollectionView alloc] initWithFrame:self.kc_contentView.bounds collectionViewLayout:self.kc_collectionViewLayout];
        collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        objc_setAssociatedObject(self, _cmd, collectionView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.kc_contentView addSubview:collectionView];
        collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        //        [self.view insertSubview:contentView belowSubview:self.kc_navigationView];
        
        [NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
        
        
        [NSLayoutConstraint constraintWithItem:collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        
        
    }
    
    return collectionView;
}

/**************TableView*****************/
- (void)setKc_tableViewStyle:(UITableViewStyle)kc_tableViewStyle
{
    objc_setAssociatedObject(self, "kc_tableViewStyle", @(kc_tableViewStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableViewStyle)kc_tableViewStyle
{
    return [objc_getAssociatedObject(self, "kc_tableViewStyle") integerValue];
}

- (UITableView *)kc_tableView
{
    UITableView *tableView = objc_getAssociatedObject(self, _cmd);
    
    if (!tableView) {
        
        tableView = [[UITableView alloc] initWithFrame:self.kc_contentView.bounds style:self.kc_tableViewStyle];
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        tableView.delegate = self;
        tableView.dataSource = self;
        objc_setAssociatedObject(self, _cmd, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.kc_contentView addSubview:tableView];
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        //        [self.view insertSubview:contentView belowSubview:self.kc_navigationView];
        
        [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
        
        
        [NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        
        
    }
    
    return tableView;
}


/**************ScrollView*****************/
- (UIScrollView *)kc_scrollView
{
    UIScrollView *scrollView = objc_getAssociatedObject(self, _cmd);
    
    if (!scrollView) {
        
        scrollView = [[UIScrollView alloc] initWithFrame:self.kc_contentView.bounds];
        scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        scrollView.delegate = self;
        objc_setAssociatedObject(self, _cmd, scrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.kc_contentView addSubview:scrollView];
        scrollView.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.view insertSubview:contentView belowSubview:self.kc_navigationView];
        
        [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
        
        
        [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.kc_contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        
        
    }
    
    return scrollView;
}

/**************ContentView*****************/
- (UIView *)kc_contentView
{
    UIView *contentView = objc_getAssociatedObject(self, _cmd);
    
    if (!contentView) {
        
        contentView = [[UIView alloc] initWithFrame:self.view.bounds];
        objc_setAssociatedObject(self, _cmd, contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view insertSubview:contentView belowSubview:self.kc_navigationView];
        
        [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
        
        
        [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        
        if (self.kc_navigationView.isTranslucent) {
            
            [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
        }else {
            
            [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.kc_navigationView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        }
        
        
    }
    
    return contentView;
}

/**************NavigationView*****************/
- (KCNavigationView *)kc_navigationView
{
    KCNavigationView *navigationView = objc_getAssociatedObject(self, _cmd);
    
    if (!navigationView) {
        
        navigationView = [KCNavigationView navigationView];
        objc_setAssociatedObject(self, _cmd, navigationView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        navigationView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:navigationView];
        
        [NSLayoutConstraint constraintWithItem:navigationView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
        
        
        [NSLayoutConstraint constraintWithItem:navigationView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
        
        if (@available(iOS 11.0, *)) {
            
            [NSLayoutConstraint constraintWithItem:navigationView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
            
        } else {
            // Fallback on earlier versions

            [NSLayoutConstraint constraintWithItem:navigationView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
        }
        
        [NSLayoutConstraint constraintWithItem:navigationView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44].active = YES;
        
    }
    
    return navigationView;
    
}

@end
