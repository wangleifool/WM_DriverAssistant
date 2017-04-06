//
//  WMModelOfExamItem.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/6.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMModelOfExamItem : NSObject

@property (strong, nonatomic) NSString *Description;
@property (strong, nonatomic) NSString *descriptionUrl;
@property (strong, nonatomic) NSString *detailImage;
@property (strong, nonatomic) NSString *detailImageUrl;
@property (assign, nonatomic) NSInteger examProjectId;
@property (strong, nonatomic) NSString *image;
@property (assign, nonatomic) NSInteger kemu;
@property (assign, nonatomic) NSInteger passRate;
@property (assign, nonatomic) NSInteger questionCount;
@property (strong, nonatomic) NSString *saturnTagId;
@property (assign, nonatomic) NSInteger skillCount;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *tiku;
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) NSInteger videoCount;
@property (strong, nonatomic) NSString *weMediaId;

@end
