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
    UIButton *tempBottomView;
    
    //
    CGPoint startPanPoint;
    CGPoint previousPanPoint;
    
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
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR);
        backgroundButton = [[UIButton alloc] initWithFrame:frame];
        [backgroundButton addTarget:self action:@selector(touchUpInsideOfBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加拖动手势
        UIPanGestureRecognizer *panGestureRecog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveToolBar:)];
        [self addGestureRecognizer:panGestureRecog];
        
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
        frameOfBt.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfBt.size.height/2; //由center决定控件的y坐标
        
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
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelNumOfErrorQuestion = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelNumOfErrorQuestion setText:@"0"];
        
        [self addSubview:self.labelNumOfErrorQuestion];
    }
    
    if (nil == self.labelNumOfRightQuestion) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.labelNumOfErrorQuestion.frame.origin.x + self.labelNumOfErrorQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelNumOfRightQuestion = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelNumOfRightQuestion setText:@"0"];
        
        [self addSubview:self.labelNumOfRightQuestion];
    }
    
    if (nil == self.labelCurQuestionIndex) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.labelNumOfRightQuestion.frame.origin.x + self.labelNumOfRightQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelCurQuestionIndex = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelCurQuestionIndex setText:@"0/0"];
        
        [self addSubview:self.labelCurQuestionIndex];
    }
    
    if (nil == tempBottomView) {
        CGRect frameOfBottomCollectionView;
        frameOfBottomCollectionView.origin.x = 0;
        frameOfBottomCollectionView.size.width = self.frame.size.width;
        frameOfBottomCollectionView.size.height = HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
        frameOfBottomCollectionView.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR;
        
        tempBottomView = [[UIButton alloc] initWithFrame:frameOfBottomCollectionView];
        [tempBottomView setBackgroundColor:[UIColor greenColor]];
        
        [self addSubview:tempBottomView];
    }
}

#pragma mark - acion of outlet
- (void)touchUpInsideOfBackgroundButton:(id)sender
{
//    [_delegate touchUpInsideOfToolBar:self];
    
    CGRect frame = self.frame;
    if (frame.origin.y == ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR) {
        frame.origin.y -= HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
    } else if (frame.origin.y == ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR){
        frame.origin.y += HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = frame;
    }];
    
}

- (void)touchUpInsideOfCollect:(id)sender
{
    
}

#pragma mark - pan gesture
- (void)moveToolBar:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:self];
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            startPanPoint = point;
            previousPanPoint = point;
            NSLog(@"begin point: %@",NSStringFromCGPoint(point));
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat locationY = point.y - previousPanPoint.y;
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + locationY, self.frame.size.width, self.frame.size.height)];
            previousPanPoint = point;
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat locationY = point.y - startPanPoint.y;
            if (locationY < 0) { //向上拉
                if (fabs(locationY) >= self.frame.size.height / 2) { //改变frame
                    [UIView animateWithDuration:0.5 animations:^{
                        CGRect frame = self.frame;
                        frame.origin.y = ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
                        self.frame = frame;
                    }];
                } else { //复原frame
                    [UIView animateWithDuration:0.5 animations:^{
                        CGRect frame = self.frame;
                        frame.origin.y = ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR;
                        self.frame = frame;
                    }];
                }
            } else { //向下拉
                if (fabs(locationY) >= self.frame.size.height / 4) { //改变frame
                    [UIView animateWithDuration:0.5 animations:^{
                        CGRect frame = self.frame;
                        frame.origin.y = ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR;
                        self.frame = frame;
                    }];
                } else { //复原frame
                    [UIView animateWithDuration:0.5 animations:^{
                        CGRect frame = self.frame;
                        frame.origin.y = ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
                        self.frame = frame;
                    }];
                }
            }
        }
            break;
        default:
            break;
    }

}

@end
