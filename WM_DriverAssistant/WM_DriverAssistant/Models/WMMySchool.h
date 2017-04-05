//
//  WMMySchool.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMMySchool : NSObject

@property (copy, nonatomic) NSString *schoolName;
@property (copy, nonatomic) NSString *addressOfSchool;
@property (assign, nonatomic) NSInteger schoolRate;
@property (copy, nonatomic) NSArray *schoolIntroduceImages;
@property (copy, nonatomic) NSArray *coaches;

@end
