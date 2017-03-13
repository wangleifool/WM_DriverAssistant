//
//  WMJiakaoViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMJiakaoViewController.h"

@interface WMJiakaoViewController ()

@end

@implementation WMJiakaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配置导航栏
    //[self configureNavigaitonBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 自定义导航栏
- (void)setNavigationTitleView:(UIView *)customView
{
    NSLog(@"setNavigationTitleView in WMJiakaoViewController");
    self.navigationItem.title = @"jiakaoTest";
}

@end
