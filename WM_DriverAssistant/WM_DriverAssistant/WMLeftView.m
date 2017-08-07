//
//  WMLeftView.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/3/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMLeftView.h"

@implementation WMLeftView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [backImageView setImage:[UIImage imageNamed:@"settingBackgroundImage"]];
        self.backgroundView = backImageView;
    }
    return self;
}

@end
