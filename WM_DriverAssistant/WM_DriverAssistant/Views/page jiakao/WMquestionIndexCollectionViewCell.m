//
//  WMquestionIndexCollectionViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/23.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMquestionIndexCollectionViewCell.h"

@implementation WMquestionIndexCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.labelQuestionIndex.layer.cornerRadius  = 16;
    self.labelQuestionIndex.layer.masksToBounds = YES;
    self.labelQuestionIndex.layer.borderWidth = 0.5;
    self.labelQuestionIndex.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected) {
        [self.labelQuestionIndex setBackgroundColor:[UIColor lightGrayColor]];
    } else {
        [self.labelQuestionIndex setBackgroundColor:[UIColor clearColor]];
    }
}

@end
