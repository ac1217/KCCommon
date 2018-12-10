//
//  KCScrollViewController.h
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCScrollViewController : KCViewController<UIScrollViewDelegate>

// ScrollView
@property (nonatomic,strong, readonly) UIScrollView *scrollView;
@end

NS_ASSUME_NONNULL_END
