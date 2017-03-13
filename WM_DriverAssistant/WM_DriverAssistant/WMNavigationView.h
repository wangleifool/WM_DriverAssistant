//
//  WMNavigationView.h
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/3/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMNavigationView;

@protocol WMNavigationBarDelegate <NSObject>

@optional
-(void)WMNavigationBar:(WMNavigationView *)navigationView showLeftViewWith:(UIButton *)button;
-(void)WMNavigationBar:(WMNavigationView *)navigationView messageWith:(UIButton *)button;
-(void)WMNavigationBar:(WMNavigationView *)navigationView locationWith:(UIButton *)button;

@end

@interface WMNavigationView : UIView

@property(weak, nonatomic)id<WMNavigationBarDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *userBtn;
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;

+(UIView *)WMNavagationBar;

@end
