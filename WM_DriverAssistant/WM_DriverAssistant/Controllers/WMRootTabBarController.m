//
//  WMRootTabBarController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMRootTabBarController.h"
#import "WMpageControllersInfo.h"
#import "URBMediaFocusViewController.h"

@interface WMRootTabBarController () <UIGestureRecognizerDelegate,URBMediaFocusViewControllerDelegate>


@property (strong, nonatomic) UIImageView *tappedImageView;
@property (strong, nonatomic) URBMediaFocusViewController *mediaFocusViewController;

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
    
//    UITapGestureRecognizer *tapGestureRecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
//    tapGestureRecog.delegate = self;
//    [self.view addGestureRecognizer:tapGestureRecog];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 全局tap手势
//- (void)tapGestureAction:(UITapGestureRecognizer *)recognizer
//{
//    URBMediaFocusViewController *controller = [[URBMediaFocusViewController alloc] init];
//    [controller showImage:self.tappedImageView.image fromView:self.view inViewController:self];
//    controller.delegate = self;
//    self.mediaFocusViewController = controller;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if ([touch.view isKindOfClass:[UIImageView class]]) {
//        self.tappedImageView = (UIImageView *)touch.view;
//        return YES;
//    }
//    return NO;
//}
//
//#pragma mark URBMediaFocusViewControllerDelegate
//
//- (void)mediaFocusViewControllerDidDisappear:(URBMediaFocusViewController *)mediaFocusViewController {
//    self.mediaFocusViewController = nil;
//}
@end
