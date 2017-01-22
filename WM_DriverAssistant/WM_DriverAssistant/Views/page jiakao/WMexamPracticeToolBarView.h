//
//  WMexamPracticeToolBarView.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DISTANCE_PER_CONTROL 16
#define WIDTH_OF_CONTROL   ((ScreenWidth - 5 * DISTANCE_PER_CONTROL)/4)

@interface WMexamPracticeToolBarView : UIView

@property (strong, nonatomic) UIButton *btCollect;
@property (strong, nonatomic) UILabel  *labelNumOfErrorQuestion;
@property (strong, nonatomic) UILabel  *labelNumOfRightQuestion;
@property (strong, nonatomic) UILabel  *labelCurQuestionIndex;

@end
