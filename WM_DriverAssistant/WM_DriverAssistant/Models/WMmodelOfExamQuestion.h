//
//  WMmodelOfExamQuestion.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;

@interface WMmodelOfExamQuestion : NSObject

@property (nonatomic, assign) NSInteger mID;
@property (nonatomic, copy) NSString *mQuestion;
@property (nonatomic, copy) NSArray  *mChoiceOfAnswer;
@property (nonatomic, copy) NSString *mDesc;
@property (nonatomic, copy) NSString *mAnswer;
@property (nonatomic, copy) NSString *mImage;

@property (nonatomic, assign) NSInteger mSectionID;
@property (nonatomic, copy) NSString *mSectionName;

@property (nonatomic, assign) NSInteger mType; // 选择题和判断题


+ (instancetype)examQuestionModelWithFMResultSet:(FMResultSet *)rs;

@end
