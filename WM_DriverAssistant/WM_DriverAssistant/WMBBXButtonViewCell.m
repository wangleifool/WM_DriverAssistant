//
//  WMBBXButtonViewCell.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 16/11/9.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBBXButtonViewCell.h"

@implementation WMBBXButtonViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"BBXBtnCell";
    WMBBXButtonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[WMBBXButtonViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    else
//    {
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (_btnTitles == nil)
    {
        _btnTitles = @[@"大牌车品",@"金银猫理财",@"真心话",@"买车狂欢惠",@"享7亿红包",@"玩转双十一",@"眼力大比评",@"免费约驾",@"测星座福地",@"手机借款",@"办理信用卡",@"更多"];
    }
//    if (_btnImages == nil)
//    {
//        _btnImages = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
//    }
    if (self)
    {
        for (int i=0; i < 12; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(768/4*(i%4), 180*(i/4), 768/4, 180);
            btn.tag = i+100;
            btn.layer.borderColor = [UIColor whiteColor].CGColor;
            btn.layer.borderWidth = 0.5;
            [btn setTitle:[_btnTitles objectAtIndex:i] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor greenColor];
            btn.titleEdgeInsets = UIEdgeInsetsMake(85, 0, 0, 0);
            [btn addTarget:self action:@selector(CellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((btn.frame.size.width-70)/2, 35, 70, 70)];
            imageView.backgroundColor = [UIColor redColor];
            [btn addSubview:imageView];
            [self.contentView addSubview:btn];
        }
        
    }
    return self;
}
-(void)CellBtnClicked:(UIButton *)button
{
    [_delegate cellButtonDidClicked:button];
}

@end
