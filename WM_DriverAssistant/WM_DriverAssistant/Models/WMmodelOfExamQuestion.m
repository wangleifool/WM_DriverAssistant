//
//  WMmodelOfExamQuestion.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMmodelOfExamQuestion.h"
#import "FMDatabase.h"

@implementation WMmodelOfExamQuestion

- (instancetype)initWithFMResultSet:(FMResultSet *)rs
{
    if (self = [super init]) {
        self.mID = [rs intForColumn:rowID];
        self.mType   = [rs intForColumn:rowType];
        
        NSString *strQuestion = [rs stringForColumn:rowQuestion];
        if (IsChoiceQuestion == self.mType) {
            NSMutableArray *array = [WMTools getAnswerFromQuestionString:strQuestion];
            self.mQuestion = array[0];
            [array removeObjectAtIndex:0];
            self.mChoiceOfAnswer = [array copy];
        } else {
            self.mQuestion = strQuestion;
            self.mChoiceOfAnswer = @[@"对",@"错"];
        }
        
        
        
        self.mAnswer = [rs stringForColumn:rowAnswer];
        self.mDesc   = [rs stringForColumn:rowDesc];
        self.mImage  = [rs stringForColumn:rowImage];
        self.mSectionID = [rs intForColumn:rowSectionID];
        self.mSectionName = [rs stringForColumn:rowSectionName];
        
    }
    return self;
}

+ (instancetype)examQuestionModelWithFMResultSet:(FMResultSet *)rs
{
    return [[self alloc] initWithFMResultSet:rs];
}

@end
