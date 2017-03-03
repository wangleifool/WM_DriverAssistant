//
//  AppDelegate.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/27.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMJiakaoViewController.h"
#import "WMSubjectOneViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WMJiakaoViewController *jiakaoViewController;
@property (strong, nonatomic) WMSubjectOneViewController *pubSubjectOneVC;
@end

