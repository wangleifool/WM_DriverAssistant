//
//  WMpageControllersInfo.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMpageControllersInfo : NSObject

@property(nonatomic,copy) NSString *className;
@property(nonatomic,copy) NSString *tabIcon;
@property(nonatomic,copy) NSString *selectedTabIcon;
@property(nonatomic,copy) NSString *title;

+ (NSArray *)pageControllers;

@end
