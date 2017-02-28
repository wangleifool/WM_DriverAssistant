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

@class WMexamPracticeToolBarView;
@protocol WMexamPracticeToolBarViewDelegate <NSObject>

- (void)touchUpInsideOfToolBar:(WMexamPracticeToolBarView *)toolBar;
- (void)touchUpInsideOfCollect:(WMexamPracticeToolBarView *)toolBar;
- (void)chooseQuestionIndex:(NSInteger)index;

@end

@interface WMexamPracticeToolBarView : UIView

@property (strong, nonatomic) UIButton *btCollect;
@property (strong, nonatomic) UIButton  *btNumOfErrorQuestion;
@property (strong, nonatomic) UIButton  *btNumOfRightQuestion;
@property (strong, nonatomic) UILabel  *labelCurQuestionIndex;

@property (strong, nonatomic) NSArray  *sectionInfos;

@property (assign, nonatomic) NSInteger numOfWrongAnswer;
@property (assign, nonatomic) NSInteger numOfCorrectAnswer;
@property (assign, nonatomic) NSInteger currentQuestionIndex;
@property (assign, nonatomic) NSInteger totalQuestionNum;

@property (strong, nonatomic) id <WMexamPracticeToolBarViewDelegate> delegate;

@end
