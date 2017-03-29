//
//  WMJiakaoViewController.m
//  WM_DriverAssistant

//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//
/*
    需要做的事情：
    1.继承父类的导航栏属性，并自定义navagation title
    2.作为科目1 到 拿本 ，五个独立视图控制器的根载体。在此处通过封装好的scrollView，添加到本视图作为子视图

 */


#import "WMJiakaoViewController.h"
#import "WMPagesScrollView.h"
#import "AppDelegate.h"
//#import "WMSubjectOneViewController.h"
//#import "WMSubjectTwoViewController.h"
//#import "WMSubjectThreeViewController.h"
//#import "WMSubjectFourViewController.m"
//#import "WMSubjectGetDriverLicenseViewController.h"

@interface WMJiakaoViewController ()
{
    AppDelegate *appDelegate;
    WMPagesScrollView *WMscrollView;
}

@end

@implementation WMJiakaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    //自定义导航栏
    [self setNavigationTitleView:nil];
    
    //添加内容视图
    NSArray *arrayTitles = [NSArray arrayWithObjects:@"科一",@"科二",@"科三",@"科四",@"拿本", nil];
    NSArray *arrayControllers = [NSArray arrayWithObjects:@"WMSubjectOneViewController",@"WMSubjectTwoViewController",@"WMSubjectThreeViewController",@"WMSubjectFourViewController",@"WMGetDiverLicenseViewController", nil];
    WMscrollView = [[WMPagesScrollView alloc] initWithFrame:CGRectMake(0, NavBarHeight7, ScreenWidth, ScreenHeight) withTitles:arrayTitles withViewControllers:arrayControllers];
    
    [self.view addSubview:WMscrollView];
    [WMscrollView setBackgroundColor:[UIColor lightGrayColor]];
    
//    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0, NavBarHeight7, ScreenWidth, ScreenHeight)];
//    [bt setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:bt];
    
    appDelegate.jiakaoViewController = self;
    
    
    [self addNotification];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"page jia kao show");
    if (appDelegate.pubSubjectOneVC) {
        [appDelegate.pubSubjectOneVC viewWillAppear:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self removeNotification];
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLeftViewInPageJiakao:) name:@"showLeftViewInPageJiakao" object:nil];
}

- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showLeftViewInPageJiakao" object:nil];
}



#pragma mark - 自定义导航栏
- (void)setNavigationTitleView:(UIView *)customView
{
    NSLog(@"setNavigationTitleView in WMJiakaoViewController");
    self.navigationItem.title = @"驾考";
}

-(void)ShowLeftView
{
    if (showLeftView)
    {
        showLeftView = false;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = WMscrollView.frame;
            
            if (IsiPad) {
                frame.origin.x = ScreenWidth - 200;
            } else {
                frame.origin.x = ScreenWidth - 100;
            }
            
            WMscrollView.frame = frame;
            self.UserView.alpha = 1;
        }];
    }
    else
    {
        showLeftView = true;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = WMscrollView.frame;
            frame.origin.x = 0;
            WMscrollView.frame = frame;
            self.UserView.alpha = 0;
        }];
    }
    
}

#pragma mark - Notification
- (void)showLeftViewInPageJiakao:(NSNotification *)notification
{
    [self ShowLeftView];
}
@end
