//
//  KCCommonViewController.m
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCViewController.h"

@interface KCViewController (){
    KCNavigationView *_navigationView;
    UIView *_contentView;
}

@end

@implementation KCViewController

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    self.navigationView.title = title;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLayout];
}


- (void)setupUI {
    
    [self.view addSubview:self.contentView];
    
    [self.view addSubview:self.navigationView];
    
    
}

- (void)setupLayout
{
    
    [NSLayoutConstraint constraintWithItem:self.navigationView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.navigationView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
    
    if (@available(iOS 11.0, *)) {
        
        [NSLayoutConstraint constraintWithItem:self.navigationView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
        
    } else {
        // Fallback on earlier versions
        
        [NSLayoutConstraint constraintWithItem:self.navigationView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    }
    
    [NSLayoutConstraint constraintWithItem:self.navigationView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44].active = YES;
    
    
    
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    
    if (self.navigationView.isTranslucent) {
        
        [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
    }else {
        
        [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.navigationView attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    }
    
    
}



#pragma mark -Getter
- (KCNavigationView *)navigationView
{
    if (!_navigationView) {
        _navigationView = [KCNavigationView navigationView];
        _navigationView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _navigationView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _contentView;
}


@end
