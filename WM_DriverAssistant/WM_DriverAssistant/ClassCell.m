//
//  ClassCell.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/11/1.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ClassCell.h"

@implementation ClassCell

+(instancetype)cellWithTableview:(UITableView *)tableView
{
    static NSString *identifier = @"Class";
    ClassCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ClassCell" owner:nil options:nil]firstObject];
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [cell.contentView.subviews.lastObject removeFromSuperview];
        }
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



@end
