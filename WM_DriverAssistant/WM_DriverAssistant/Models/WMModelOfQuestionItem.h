//
//  WMModelOfQuestionItem.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/9.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WMModelOfQuestionItem : NSObject

@property (assign, nonatomic, readonly) NSInteger questionIndex;
@property (strong, nonatomic, readonly) NSString *questionMainContent;
@property (strong, nonatomic, readonly) UIImage  *questionAttachImage;
@property (strong, nonatomic, readonly) NSString *answerA;
@property (strong, nonatomic, readonly) NSString *answerB;
@property (strong, nonatomic, readonly) NSString *answerC;
@property (strong, nonatomic, readonly) NSString *answerD;
@property (strong, nonatomic, readonly) NSString *theRightAnswer;
@property (strong, nonatomic, readonly) NSString *testPointIntroduce; //考点介绍

@end
