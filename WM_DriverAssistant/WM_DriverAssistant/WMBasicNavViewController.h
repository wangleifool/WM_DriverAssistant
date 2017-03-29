//
//  WMBasicNavViewController.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMNavigationView.h"

@interface WMBasicNavViewController : UIViewController
{
    BOOL  showLeftView;
}

@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,strong)UIView *UserView;
@property(nonatomic,strong)NSArray *userColum;
@property (nonatomic,strong)UIView          *contentView;
@property (nonatomic,strong)WMNavigationView    *navView;
//@property(nonatomic,assign)BOOL  showLeftView;

- (void)configureNavigaitonBar;
- (void)setNavigationTitleView:(UIView *)customView;
- (void)setNavigationLeftView:(UIView *)customView sel:(SEL)sel;
- (void)setNavigationRightView:(UIView *)customView sel:(SEL)sel;
-(void)setNavigationLeftbutton:(NSString *)title sel:(SEL)selector;
-(void)setNavigationRightbutton:(NSString *)title sel:(SEL)selector;

- (void)setStatusBarStyle:(UIStatusBarStyle)style;
-(void)ShowLeftView:(UIPanGestureRecognizer *)panGesture;
-(void)hideLeftView;
@end
