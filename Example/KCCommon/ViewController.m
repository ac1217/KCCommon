//
//  ViewController.m
//  KCCommon
//
//  Created by Erica on 2018/8/3.
//  Copyright © 2018年 Erica. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KCCommon.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"我是标题";
    
    
}



- (IBAction)alert:(id)sender {
    
    KCAlertView *alertView = [[KCAlertView alloc] init];
    alertView.title = @"警告：";
    
    KCAlertAction *action = [KCAlertAction new];
    action.title = @"取消";
    action.style = KCAlertActionStyleCancel;
    KCAlertAction *action4 = [KCAlertAction new];
    action4.title = @"返回";
    action4.style = KCAlertActionStyleCancel;
    
    KCAlertAction *action1 = [KCAlertAction new];
    action1.title = @"哈哈";
    action1.style = KCAlertActionStyleDefault;
    KCAlertAction *action2 = [KCAlertAction new];
    action2.title = @"呵呵";
    action2.style = KCAlertActionStyleDestructive;
    
    KCAlertAction *action3 = [KCAlertAction new];
    action3.title = @"嘻嘻";
    action3.style = KCAlertActionStyleDefault;
    
    alertView.actions = @[action, action1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 120)];
    view.backgroundColor = [UIColor redColor];
//    self.view.kc_alertView.style = KCAlertViewStyleActionSheet;
        alertView.showView = view;
    
//    self.view.kc_alertView.backgroundDismiss = YES;
    [alertView showInView:self.contentView];
}
- (IBAction)actionSheet:(id)sender {
    
    KCAlertView *alertView = [[KCAlertView alloc] init];
    
//    alertView.detail = @"啥办法is都返回碎豆腐是对方";
    
    KCAlertAction *action = [KCAlertAction new];
    action.title = @"取消";
    action.style = KCAlertActionStyleCancel;
    KCAlertAction *action4 = [KCAlertAction new];
    action4.title = @"返回";
    action4.style = KCAlertActionStyleCancel;
    
    KCAlertAction *action1 = [KCAlertAction new];
    action1.title = @"哈哈";
    action1.style = KCAlertActionStyleDefault;
    KCAlertAction *action2 = [KCAlertAction new];
    action2.title = @"呵呵";
    action2.style = KCAlertActionStyleDestructive;
    
    KCAlertAction *action3 = [KCAlertAction new];
    action3.title = @"嘻嘻";
    action3.style = KCAlertActionStyleDefault;
    action3.titleColor = [UIColor orangeColor];
    action3.titleFont = [UIFont boldSystemFontOfSize:18];
    alertView.actions = @[action, action1, action2, action3, action4];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 120)];
    view.backgroundColor = [UIColor redColor];
    alertView.style = KCAlertViewStyleActionSheet;
    //    self.view.kc_alertView.showView = view;
    
    alertView.backgroundDismiss = YES;
    [alertView showInView:self.contentView];
    
}
- (IBAction)loading:(id)sender {
    
    
}

- (IBAction)hide:(id)sender {
    
}



@end
