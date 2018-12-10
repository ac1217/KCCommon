//
//  KCCollectionViewController.m
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCCollectionViewController.h"

@interface KCCollectionViewController () {
    UICollectionViewLayout *_collectionViewLayout;
    UICollectionView *_collectionView;
}

@end

@implementation KCCollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super init]) {
        
        _collectionViewLayout = layout;
        
    }
    return self;
}

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.collectionView];
    
}

- (void)setupLayout
{
    [super setupLayout];
    
    [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSLog(@"找不到方法实现：%@", _cmd);
    
    return 0;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        if (!_collectionViewLayout) {
            _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        }
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_collectionViewLayout];
        _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _collectionView;
}



@end
