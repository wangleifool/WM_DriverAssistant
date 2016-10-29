//
//  WMBasicNavViewController.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMBasicNavViewController : UIViewController

- (void)configureNavigaitonBar;
- (void)setNavigationTitleView:(UIView *)customView;
- (void)setNavigationLeftView:(UIView *)customView sel:(SEL)sel;
- (void)setNavigationRightView:(UIView *)customView sel:(SEL)sel;

- (void)setStatusBarStyle:(UIStatusBarStyle)style;

@end
