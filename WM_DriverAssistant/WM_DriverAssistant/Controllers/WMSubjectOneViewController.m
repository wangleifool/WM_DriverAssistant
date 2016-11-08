//
//  WMSubjectOneViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMSubjectOneViewController.h"
#import "WMMyDriverMasterView.h"
#import "WMAdvertisementPagingScrollView.h"

@interface WMSubjectOneViewController () <WMMyDriverMasterViewDelegate>
{
    WMMyDriverMasterView *driverMasterView;
    WMAdvertisementPagingScrollView *advertisementView;
}
@end

@implementation WMSubjectOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
//    self.mainScrollView.contentSize = CGSizeMake(0, self.mainScrollView.bounds.size.height);
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        [((UIScrollView *)self.view) setContentSize:CGSizeMake(0, self.view.bounds.size.height*2)];
    }
    
    //滚动广告
    advertisementView = [[WMAdvertisementPagingScrollView alloc] initWithFrame:CGRectMake(0, 5, ScreenWidth, 190)];
    
    [advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang01"]];
    [advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang02"]];
    [advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang03"]];
    
    
    [self.view addSubview:advertisementView];
    
    //添加我的教练视图
    driverMasterView = [[WMMyDriverMasterView alloc] init];
    CGRect frame = CGRectMake(0, 200, ScreenWidth, driverMasterView.bounds.size.height);
    [driverMasterView setMyFrame:frame];
    driverMasterView.delegate = self;
    [self.view addSubview:driverMasterView];
    
    
}


#pragma mark - 教练视图代理
- (void)actionOfTapMyDriverMasterView:(WMMyDriverMasterView *)MyDvierMasterview
{
    NSLog(@"get view :%@",MyDvierMasterview);
}

@end
