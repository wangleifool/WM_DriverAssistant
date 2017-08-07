//
//  WMSubjectTwoThreeExamItemTableViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/6.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMSubjectTwoThreeExamItemTableViewCell.h"

@implementation WMSubjectTwoThreeExamItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)examItemCellWithTableView:(UITableView *)tableView
{
    WMSubjectTwoThreeExamItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WMSubjectTwoThreeExamItemTableViewCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WMSubjectTwoThreeExamItemTableViewCell" owner:nil options:nil] firstObject];
    }
    
    return cell;
}

- (void)setModelExamItem:(WMModelOfExamItem *)modelExamItem
{
    _modelExamItem = modelExamItem;
    
    [self.labelOfExamTitle setText:modelExamItem.title];
    [self.labelOfPassPercent setText:[NSString stringWithFormat:@"通过率 %ld%%",modelExamItem.passRate]];
    [self.labelOfExamDescription setText:modelExamItem.Description];
    [self.labelBtOfBrowseCount setTitle:[NSString stringWithFormat:@"%ld",modelExamItem.skillCount] forState:UIControlStateNormal];
    [self.labelBtOfConversationCount setTitle:[NSString stringWithFormat:@"%ld",modelExamItem.questionCount] forState:UIControlStateNormal];
    [self.labelBtOfVideoCount setTitle:[NSString stringWithFormat:@"%ld",modelExamItem.videoCount] forState:UIControlStateNormal];
    
    NSURL *url = [NSURL URLWithString:modelExamItem.image];
    [self.imageViewOfExamItem setImageWithURL:url placeholderImage:[UIImage imageNamed:@"muc_photo_picker_default"]];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *url = [NSURL URLWithString:modelExamItem.image];
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.imageViewOfExamItem setImage:[UIImage imageWithData:data]];
//        });
//        
//    });
}

@end
