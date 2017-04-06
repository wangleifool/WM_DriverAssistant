//
//  WMMySchoolTableViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMMySchoolTableViewCell.h"

@implementation WMMySchoolTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setMySchool:(WMMySchool *)mySchool
{
    [self.labelSchoolRate setText:[NSString stringWithFormat:@"%@ NO.%ld",mySchool.schoolName,mySchool.schoolRate]];
}

+ (instancetype)mySchoolCellWithTableView:(UITableView *)tableView
{
    WMMySchoolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mySchoolCell"];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WMMySchoolTableViewCell" owner:nil options:nil] firstObject];
    }
    
    return cell;
}

@end
