//
//  WMRootTabBarController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMRootTabBarController.h"
#import "WMpageControllersInfo.h"

@interface WMRootTabBarController ()

@end

@implementation WMRootTabBarController

#pragma mark - 生命周期
- (instancetype)init
{
    if (self = [super init]) {
        
        //设置tabbar 管理的视图控制器们
        self.viewControllers = [WMpageControllersInfo pageControllers];        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
