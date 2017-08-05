//
//  WMSubjectTwoPracticeTableViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMSubjectTwoPracticeTableViewCell.h"

@implementation WMSubjectTwoPracticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableview:(UITableView *)tableview withSubjectIndex:(NSInteger)index //每个科目都会用到这个模块，根据不同的index，展示不同的内容
{
    static NSString *ID = @"Subject_Practice_Cell";
    WMSubjectTwoPracticeTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WMSubjectTwoPracticeTableViewCell" owner:nil options:nil] firstObject];
        
        switch (index) {
            case 1:
                
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            default:
            {
                [cell.topImageBtView setBackgroundImage:[UIImage imageNamed:@"ad2"] forState:UIControlStateNormal];
                
                cell.btSinglePractice.delegate = cell;
                [cell.btSinglePractice.titleLabel setText:@"单项练习"];
                [cell.btSinglePractice.iconImage setImage:[UIImage imageNamed:@"5"]];
                
                cell.btExamSecret.delegate = cell;
                [cell.btExamSecret.titleLabel setText:@"考试秘籍"];
                [cell.btExamSecret.iconImage setImage:[UIImage imageNamed:@"15"]];
                
                cell.btAwardDrive.delegate = cell;
                [cell.btAwardDrive.titleLabel setText:@"有奖试驾"];
                [cell.btAwardDrive.iconImage setImage:[UIImage imageNamed:@"6"]];
                
                cell.btStudentWelfare.delegate = cell;
                [cell.btStudentWelfare.titleLabel setText:@"学员福利"];
                [cell.btStudentWelfare.iconImage setImage:[UIImage imageNamed:@"13"]];
            }
                break;
        }
    }
    
    
    
    return cell;
}

- (IBAction)btPressed:(id)sender {
    [_delegate touchUpActionOfPracticeTableViewCellOutlet:sender];
}

- (void)didTapHDButton:(HDButton *)sender
{
    [_delegate touchUpActionOfPracticeTableViewCellOutlet:sender];
}

@end
