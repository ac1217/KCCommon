//
//  KCCollectionViewController.h
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCCollectionViewController : KCViewController <UICollectionViewDelegate, UICollectionViewDataSource>

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;


// CollectionView  获取CollectionView前需要设置layout
@property (nonatomic,strong, readonly) UICollectionViewLayout *collectionViewLayout;
@property (nonatomic,strong, readonly) UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
