//
//  WMBasicNavViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBasicNavViewController.h"

@interface WMBasicNavViewController ()



@end

@implementation WMBasicNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //配置导航栏
    [self configureNavigaitonBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 自定义导航栏
- (void)configureNavigaitonBar
{
    //设置导航栏背景颜色
    [self setNavigationBarImage:@""];
    
    //自定义左边的tab item
    [self setNavigationLeftView:nil sel:nil];
    
    //自定义右边的tab item
    [self setNavigationRightView:nil sel:nil];
    
    //自定义title视图，该方法需要子类重载（不同的页面，显示不同）
    //[self setNavigationTitleView:nil];
    
}

- (void)setNavigationBarImage:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];  //本行做测试，需要删除
}

- (void)setNavigationLeftView:(UIView *)customView sel:(SEL)sel
{
    NSLog(@"setNavigationLeftView in WMBasicNavViewController");
}

- (void)setNavigationRightView:(UIView *)customView sel:(SEL)sel
{
    NSLog(@"setNavigationRightView in WMBasicNavViewController");
}

- (void)setNavigationTitleView:(UIView *)customView
{
    NSLog(@"setNavigationTitleView in WMBasicNavViewController");
}

- (void)setStatusBarStyle:(UIStatusBarStyle)style
{
    
}

@end
