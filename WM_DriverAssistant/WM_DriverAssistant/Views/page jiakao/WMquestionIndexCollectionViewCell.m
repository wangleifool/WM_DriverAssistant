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
    
    self.btQuestionIndex.layer.cornerRadius  = 16;
    self.btQuestionIndex.layer.masksToBounds = YES;
}

@end
