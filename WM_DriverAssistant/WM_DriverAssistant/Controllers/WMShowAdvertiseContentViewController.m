    //
//  WMShowAdvertiseContentViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/18.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMShowAdvertiseContentViewController.h"

@interface WMShowAdvertiseContentViewController ()
{
    NSString *webURL;
}

@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation WMShowAdvertiseContentViewController

- (instancetype)initWithWebURL:(NSString *)url
{
    if (self = [super init]) {
        self = [[WMShowAdvertiseContentViewController alloc] initWithNibName:@"WMShowAdvertiseContentViewController" bundle:nil];
        webURL = url;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavigationBar];
    
    NSURL *URL = [NSURL URLWithString:webURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.mainWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - configure navigation
- (void)configNavigationBar
{
    [self configNavigationTitle];
    [self configNavigationLeftView];
    [self configNavigationRightView];
}

- (void)configNavigationLeftView
{
    UIBarButtonItem *btItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leftBarButtonPressed:)];
    self.navigationItem.leftBarButtonItem = btItem;
}

- (void)leftBarButtonPressed:(id)sender
{
//    [self addTransitionAnimationWithType:nil subType:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)configNavigationRightView
{
    UIBarButtonItem *btItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more2"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPressed:)];
    self.navigationItem.rightBarButtonItem = btItem;
}

- (void)rightBarButtonPressed:(id)sender
{
    
}

- (void)configNavigationTitle
{
    self.navigationItem.title = @"广告";
}

#pragma mark - help
- (void)addTransitionAnimationWithType:(NSString *)type subType:(NSString *)subType
{
    CATransition * animation = [CATransition animation];
    
    animation.duration = 0.3;    //  时间
    
    /**  type：动画类型
     *  pageCurl       向上翻一页
     *  pageUnCurl     向下翻一页
     *  rippleEffect   水滴
     *  suckEffect     收缩
     *  cube           方块
     *  oglFlip        上下翻转
     */
    //    animation.type = @"pageCurl";
    
    /**  type：页面转换类型
     *  kCATransitionFade       淡出
     *  kCATransitionMoveIn     覆盖
     *  kCATransitionReveal     底部显示
     *  kCATransitionPush       推出
     */
    animation.type = kCATransitionPush;
    
    //PS：type 更多效果请 搜索： CATransition
    
    /**  subtype：出现的方向
     *  kCATransitionFromRight       右
     *  kCATransitionFromLeft        左
     *  kCATransitionFromTop         上
     *  kCATransitionFromBottom      下
     */
    animation.subtype = kCATransitionFromLeft;
    
    [self.view.window.layer addAnimation:animation forKey:nil];
}

@end
