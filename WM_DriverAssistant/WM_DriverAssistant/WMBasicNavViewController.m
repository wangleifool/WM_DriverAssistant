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
    
    [self configureNavigaitonBar];
    UITapGestureRecognizer *gs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftView)];
    gs.numberOfTapsRequired = 1;
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView)];
    swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
    [self.view addGestureRecognizer:gs];
    _showLeftView = true;
    _userColum = @[@"我的题库",@"我的驾校",@"同步数据",@"下载科二、科三视频",@"题库更新",@"我的订单",@"赚取金币",@"设置"];
    [self initBackView:self.view];
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
    [self setNavigationLeftbutton:@"icon_touxiangtianjia_.png" sel:@selector(addView)];
    [self setNavigationRightbutton:nil sel:nil];
    
    //自定义右边的tab item
    //[self setNavigationRightView:nil sel:nil];
    
    //自定义title视图，该方法需要子类重载（不同的页面，显示不同）
    //[self setNavigationTitleView:nil];
    
}

#pragma mark 初始化用户视图
-(void)initBackView:(UIView *)view
{
    _UserView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 618, 1024)];
    _UserView.backgroundColor = [UIColor orangeColor];
    _UserView.alpha = 0;
    UISwipeGestureRecognizer *gs = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView)];
    gs.direction = UISwipeGestureRecognizerDirectionLeft;
    [_UserView addGestureRecognizer:gs];
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 618, 200)];
    loginBtn.backgroundColor = [UIColor whiteColor];
    [loginBtn addTarget:self action:@selector(UserBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_UserView addSubview:loginBtn];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, (loginBtn.frame.size.height-80)/2, 80, 80)];
    iconImage.backgroundColor = [UIColor greenColor];
    [loginBtn addSubview:iconImage];
    UILabel *logLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.frame.origin.x+85, iconImage.frame.origin.y, 100, 30)];
    logLab.text = @"立即登陆";
    logLab.textColor = [UIColor blueColor];
    logLab.font = [UIFont systemFontOfSize:15];
    [loginBtn addSubview:logLab];
    for (int i = 0; i <= 7; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i != 7) {
            btn.frame = CGRectMake(0, 200+(824-400)/7*i, 618, (824-400)/7);
        }
        else
        {
            btn.frame = CGRectMake(0, _UserView.frame.size.height-70-(824-400)/7, 618, (824-400)/7);
        }
        btn.tag = i+100;
        [btn addTarget:self action:@selector(UserBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor redColor];
        [_UserView addSubview:btn];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, (btn.frame.size.height-30)/2, 160, 30)];
        lab.textColor = [UIColor whiteColor];
        lab.text = [_userColum objectAtIndex:i];
        [btn addSubview:lab];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, lab.frame.origin.y, 30, 30)];
        image.backgroundColor = [UIColor whiteColor];
        [btn addSubview:image];
    }
    [view addSubview:_UserView];
    [view sendSubviewToBack:_UserView];
}
#pragma mark 用户界面有按钮被按下
-(void)UserBtnClicked:(UIButton *)button
{
    NSLog(@"登陆");
}
#pragma mark 左边按钮按下
-(void)addView
{
    [self ShowLeftView];
}
#pragma mark 显示左边用户视图
-(void)ShowLeftView
{
    if (_showLeftView)
    {
        _showLeftView = false;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = self.tableView.frame;
            frame.origin.x = 618;
            self.tableView.frame = frame;
            self.UserView.alpha = self.tableView.frame.origin.x/618;
        }];
    }
    else
    {
        _showLeftView = true;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = self.tableView.frame;
            frame.origin.x = 0;
            self.tableView.frame = frame;
            self.UserView.alpha = self.tableView.frame.origin.x/618;
        }];
    }
    
}
#pragma mark 隐藏左边视图
-(void)hideLeftView
{
    _showLeftView = true;
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.tableView.frame;
        frame.origin.x = 0;
        self.tableView.frame = frame;
        self.UserView.alpha = self.tableView.frame.origin.x/618;
    }];
}
- (void)setNavigationBarImage:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor darkGrayColor]];  //本行做测试，需要删除
}

- (void)setNavigationLeftView:(UIView *)customView sel:(SEL)sel
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    UITapGestureRecognizer *tapGs = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel];
    [customView addGestureRecognizer:tapGs];
    self.navigationItem.leftBarButtonItem = item;
    
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
-(void)setNavigationLeftbutton:(NSString *)title sel:(SEL)selector
{
    UIBarButtonItem *item = nil;
    if ([title hasSuffix:@"png"])
    {
        item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:title] style:UIBarButtonItemStylePlain target:self action:selector];
    }
    else
    {
        item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selector];
    }
    item.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)setNavigationRightbutton:(NSString *)title sel:(SEL)selector
{
    UIBarButtonItem *item = nil;
    if ([title hasSuffix:@"png"])
    {
        item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:title] style:UIBarButtonItemStylePlain target:self action:selector];
    }
    else
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    //item.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = item;
}
@end
