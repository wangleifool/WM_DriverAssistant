//
//  WM_MyButton.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WM_MyButton.h"

@implementation WM_MyButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat midX = self.frame.size.width / 2;
    CGFloat midY = self.frame.size.height / 2;
    self.titleLabel.center = CGPointMake(midX,midY + 25);
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.center = CGPointMake(midX, midY - 10);
}

@end
