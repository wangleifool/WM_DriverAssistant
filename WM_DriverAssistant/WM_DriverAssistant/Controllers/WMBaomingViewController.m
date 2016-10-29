//
//  WMBaomingViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBaomingViewController.h"

@interface WMBaomingViewController ()

@end

@implementation WMBaomingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //配置导航栏
//    [self configureNavigaitonBar];
    [self setNavigationTitleView:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 自定义导航栏
- (void)setNavigationTitleView:(UIView *)customView
{
    self.navigationItem.title = @"hello world";
}


@end
