//
//  WM_BanerView.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2016/11/22.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WM_BanerView.h"

@implementation WM_BanerView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-40)/2.0, 15, 40, 40)];
        [self addSubview:self.iconView];
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconView.frame.origin.y+self.iconView.frame.size.height+10, frame.size.width, 25)];
        self.titleLab.textColor = [UIColor whiteColor];
        self.titleLab.font = [UIFont systemFontOfSize:15];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
    }
    return self;
}

@end
