//
//  WMPurchaseNavViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMPurchaseNavViewController.h"

@interface WMPurchaseNavViewController ()

@end

@implementation WMPurchaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *colorImage = [WMTools createImageWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
