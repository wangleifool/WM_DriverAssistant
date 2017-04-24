//
//  WMexamPracticeContentView.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMexamPracticeContentView;

@protocol WMexamPracticeContentViewDelegate <NSObject>

- (void)cellImageTapped:(UIImageView *)imageView;

@end

@interface WMexamPracticeContentView : UIView

@property (nonatomic, assign) NSInteger currentQuestionIndex;
@property (nonatomic, copy)   NSArray   *dataArray;  //question and user comment
@property (strong, nonatomic) id <WMexamPracticeContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)allQuestionArray;

@end
