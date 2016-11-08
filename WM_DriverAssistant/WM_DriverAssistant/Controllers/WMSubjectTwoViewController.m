//
//  WMSubjectTwoViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMSubjectTwoViewController.h"
#import "WMMyDriverMasterView.h"

@interface WMSubjectTwoViewController () <WMMyDriverMasterViewDelegate>
{
    WMMyDriverMasterView *driverMasterView;
}
@end

@implementation WMSubjectTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        [((UIScrollView *)self.view) setContentSize:CGSizeMake(0, self.view.bounds.size.height*2)];
    }
    
    //添加我的教练视图
    driverMasterView = [[WMMyDriverMasterView alloc] init];
    CGRect frame = CGRectMake(0, 50, ScreenWidth, driverMasterView.bounds.size.height);
    [driverMasterView setMyFrame:frame];
    driverMasterView.delegate = self;
    [self.view addSubview:driverMasterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionOfTapMyDriverMasterView:(WMMyDriverMasterView *)MyDvierMasterview
{

}

@end
