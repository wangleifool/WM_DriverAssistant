//
//  WM_CollectionViewCell.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2016/11/22.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WM_CollectionViewCell.h"

@implementation WM_CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-90)/2, 20, 90, 90)];
        [self.contentView addSubview:self.iconView];
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconView.frame.origin.y+self.iconView.frame.size.height+10, self.frame.size.width, 30)];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.titleLab];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

@end
