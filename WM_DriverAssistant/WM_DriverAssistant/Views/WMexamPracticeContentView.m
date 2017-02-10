//
//  WMexamPracticeContentView.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMexamPracticeContentView.h"
#import "WMAutoBreakLineLabel.h"

@interface WMexamPracticeContentView ()
{
    UIScrollView *upperPartBackgroundScrollView; //本视图分为两大部分，1答题和讲解 2车友评价
    
    WMAutoBreakLineLabel *labelMainQuestionContent;
    UIImageView          *questionAttachImageView;
    
}


@end

@implementation WMexamPracticeContentView

- (void)layoutSubviews
{
    
}

@end
