//
//  KCScrollViewController.m
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCScrollViewController.h"

@interface KCScrollViewController () {
    UIScrollView *_scrollView;
}

@end

@implementation KCScrollViewController

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.scrollView];
    
}

- (void)setupLayout
{
    [super setupLayout];
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    
}

- (UIScrollView *)scrollView
{
    
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _scrollView.delegate = self;
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _scrollView;
    
}

@end
