//
//  WMexamPracticeToolBarView.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMexamPracticeToolBarView.h"

@interface WMexamPracticeToolBarView ()
{
    UIButton *backgroundButton;
    UIProgressView *progressOfWholeQuestion;
}

@end


@implementation WMexamPracticeToolBarView


#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setBackgroundColor:[UIColor darkGrayColor]];
    
    if (nil == backgroundButton) {
        backgroundButton = [[UIButton alloc] initWithFrame:self.frame];
        [backgroundButton addTarget:self action:@selector(touchUpInsideOfBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:backgroundButton];
    }
    
    if (nil == progressOfWholeQuestion) {
        CGRect frameOfProgress = self.frame;
        frameOfProgress.size.height = 2;
        frameOfProgress.origin.y = 0;
        progressOfWholeQuestion = [[UIProgressView alloc] initWithFrame:frameOfProgress];
        [progressOfWholeQuestion setTintColor:[UIColor blueColor]];
        progressOfWholeQuestion.progress = 0.5;
        
        [self addSubview:progressOfWholeQuestion];
    }
    
    if (nil == self.btCollect) {
        CGRect frameOfBt;
        frameOfBt.origin.x = DISTANCE_PER_CONTROL;
        frameOfBt.size.width = WIDTH_OF_CONTROL;
        frameOfBt.size.height = 32;
        frameOfBt.origin.y = self.frame.size.height/2 - frameOfBt.size.height/2; //由center决定控件的y坐标
        
        self.btCollect = [[UIButton alloc] initWithFrame:frameOfBt];
        [self.btCollect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btCollect setTitle:@"收藏" forState:UIControlStateNormal];
        [self.btCollect addTarget:self action:@selector(touchUpInsideOfCollect:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.btCollect];
    }
    
    if (nil == self.labelNumOfErrorQuestion) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.btCollect.frame.origin.x + self.btCollect.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = self.frame.size.height/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelNumOfErrorQuestion = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelNumOfErrorQuestion setText:@"0"];
        
        [self addSubview:self.labelNumOfErrorQuestion];
    }
    
    if (nil == self.labelNumOfRightQuestion) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.labelNumOfErrorQuestion.frame.origin.x + self.labelNumOfErrorQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = self.frame.size.height/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelNumOfRightQuestion = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelNumOfRightQuestion setText:@"0"];
        
        [self addSubview:self.labelNumOfRightQuestion];
    }
    
    if (nil == self.labelCurQuestionIndex) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.labelNumOfRightQuestion.frame.origin.x + self.labelNumOfRightQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = self.frame.size.height/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelCurQuestionIndex = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelCurQuestionIndex setText:@"0/0"];
        
        [self addSubview:self.labelCurQuestionIndex];
    }
}

#pragma mark - acion of outlet
- (void)touchUpInsideOfBackgroundButton:(id)sender
{
    
}

- (void)touchUpInsideOfCollect:(id)sender
{
    
}

@end
