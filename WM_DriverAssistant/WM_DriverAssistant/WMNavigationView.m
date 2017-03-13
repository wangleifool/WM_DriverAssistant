//
//  WMNavigationView.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/3/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMNavigationView.h"

@implementation WMNavigationView

+(UIView *)WMNavagationBar
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WMNavigationView" owner:nil options:nil] lastObject];
}

#pragma mark - ButtonCliked

- (IBAction)leftButtonCliked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(WMNavigationBar:showLeftViewWith:)]) {
        [self.delegate WMNavigationBar:self showLeftViewWith:sender];
    }
   // [self.delegate WMNavigationBar:self showLeftViewWith:sender];
}
- (IBAction)rightButtonCliked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(WMNavigationBar:messageWith:)]) {
        [self.delegate WMNavigationBar:self messageWith:sender];
    }
}
- (IBAction)locationButtonCliked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(WMNavigationBar:locationWith:)]) {
        [self.delegate WMNavigationBar:self locationWith:sender];
    }
}

@end
