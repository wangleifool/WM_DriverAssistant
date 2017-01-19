//
//  JiaXiaoCell.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/11/1.
//  Copyright © 2016年 my. All rights reserved.
//

#import "JiaXiaoCell.h"

@implementation JiaXiaoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableview:(UITableView *)tableView
{
    static NSString *identifier = @"JiaXiaoCell";
    JiaXiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JiaXiaoCell" owner:nil options:nil] firstObject];
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    return cell;
}

@end
