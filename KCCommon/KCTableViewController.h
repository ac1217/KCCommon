//
//  KCTableViewController.h
//  KCCommon
//
//  Created by Erica on 2018/12/10.
//  Copyright © 2018 Erica. All rights reserved.
//

#import "KCViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCTableViewController : KCViewController<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithStyle:(UITableViewStyle)style;
@property (nonatomic,strong, readonly) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
