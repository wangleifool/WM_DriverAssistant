//
//  WMBaoMingViewController.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import "WMBaomingViewController.h"
#import "WM_BaoMingView.h"
#import "JiaXiaoCell.h"
#import "ClassCell.h"
#import "WMScrollView.h"

#define MyScreenWidth  ([UIScreen mainScreen].bounds.size.width)

@interface WMBaomingViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)WMScrollView *mainScrollView;
@property(nonatomic,strong)WM_BaoMingView  *leftTableView;
@property(nonatomic,strong)WM_BaoMingView  *centerTableView;
@property(nonatomic,strong)WM_BaoMingView  *rightTableView;


@property(nonatomic,strong)NSArray *buttonTitle;
@property(nonatomic,strong)UIView  *bottomView;
@property(nonatomic,strong)NSArray *titles;

@end

@implementation WMBaomingViewController
#pragma mark - 懒加载
-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[WMScrollView alloc] initWithFrame:CGRectMake(0, 114, kScreenWidth, kScreenHeight-114-49)];
        _mainScrollView.backgroundColor = [UIColor redColor];
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.contentSize = CGSizeMake(kScreenWidth*3, kScreenHeight-114-49);
        [_mainScrollView addSubview:self.leftTableView];
        [_mainScrollView addSubview:self.centerTableView];
        [_mainScrollView addSubview:self.rightTableView];

//        UIPanGestureRecognizer *swip = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView:)];
//        [_mainScrollView addGestureRecognizer:swip];
    }
    return _mainScrollView;
}
-(WM_BaoMingView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView = [[WM_BaoMingView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-114-49)];
    }
    return _leftTableView;
    
}
-(WM_BaoMingView *)centerTableView
{
    if (!_centerTableView) {
        _centerTableView = [[WM_BaoMingView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight-163)];
    }
    return _centerTableView;
}
-(WM_BaoMingView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView = [[WM_BaoMingView alloc] initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, kScreenHeight-163)];
    }
    return _rightTableView;
}
-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(45, self.mainScrollView.frame.origin.y-2, kScreenWidth/3-90, 2)];
        _bottomView.backgroundColor = [UIColor darkGrayColor];
    }
    return _bottomView;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.navView.locationBtn.hidden = NO;
    self.navView.title.text = @"报名";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [sessionManager GET:@"https://jiaxiao.kakamobi.cn/api/open/v3/jiaxiao/list-contact-baoming.htm?_a=09495AxAV6330Vz7y0V6xyAV97060wz7w2z9&_appName=jiakaobaodianxingui&_appUser=e877af15e7011600433f7e2e29019c56&_cityCode=510100&_cityName=%E6%88%90%E9%83%BD%E5%B8%82&_device=%E6%A2%85%E6%AF%85%E7%9A%84%20iPhone&_firstTime=2017-02-23%2010%3A07%3A42&_gpsCity=510100&_gpsType=baidu&_html5=false&_imei=959fffbd46099186b511ec3c0d644112dbffd22a&_j=1.0&_jail=false&_latitude=30.673382703993&_launch=24&_longitude=103.7909242079&_mac=959fffbd46099186b511ec3c0d644112dbffd22a&_manufacturer=Apple&_network=wifi&_operator=C&_pkgName=cn.mucang.ios.jiakaobaodianPromise&_platform=iphone&_product=%E9%A9%BE%E8%80%83%E5%AE%9D%E5%85%B8%E6%96%B0%E8%A7%84&_productCategory=jiakaobaodian&_r=6a3fc285eec6d8fc2e56e495aa06769b&_renyuan=mucang&_screenDip=3&_screenHeight=2208&_screenWidth=1242&_system=iOS&_systemVersion=10.1.1&_u=v9z2A166V0918Vz193V683vVv8w6402y92vx&_userCity=510100&_vendor=appstore&_version=6.6.4&_webviewVersion=4.7&cityCode=510100&latitude=30.679572&limit=10&longitude=103.797482&onlyNotContractor=1&page=1&schoolCode=510100240&schoolName=%E5%A4%A9%E6%AC%A3%E9%A9%BE%E6%A0%A1&sortType=10&sign=142ddee17d002c09f681811966bd2c2c01" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject){
//        //NSDictionary *dict = [responseObject objectForKey:@"data"];
//        //self.dataArray = [GoodsModel arrayFromDict:dict];
//        //self.Categorys = [NSMutableArray arrayWithArray:arr];
//        
//        NSLog(@"%@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error){
//        NSLog(@"%@",error);
//    }];
    
    _buttonTitle = @[@"找驾校",@"找教练",@"找陪练"];
    [self initBannerButton];
    [self.contentView addSubview:self.mainScrollView];
}
#pragma mark - 初始化顶部Banner
-(void)initBannerButton
{
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(kScreenWidth/3*i, 64, kScreenWidth/3, 50);
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 50+i;
        [btn setTitle:[_buttonTitle objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn addTarget:self action:@selector(bannerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
    [self.contentView addSubview:self.bottomView];
    UIButton *button = [self.view viewWithTag:50];
    [self bannerButtonClicked:button];
}
#pragma mark - 顶部banner按钮点击
-(void)bannerButtonClicked:(UIButton *)button
{
    UIButton *btn = nil;
    NSInteger index = button.tag-50;
    for (int i = 0; i < 3; i++) {
        
        btn = [self.view viewWithTag:i+50];
        if (i == index) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
    }
    CGFloat x = button.frame.origin.x;
    x = x + 45;
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake(x, self.mainScrollView.frame.origin.y-2, kScreenWidth/3-90, 2);
        self.mainScrollView.contentOffset = CGPointMake(kScreenWidth*index, 0);
    }];
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"test");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat hun = 0;
//    if (scrollView == self.mainScrollView) {
//        hun = ((int)(scrollView.contentOffset.x)%(int)kScreenWidth)/kScreenWidth;
//        NSLog(@"%f",hun);
//        CGFloat originX = self.bottomView.frame.origin.x;
//        self.bottomView.frame = CGRectMake(originX+90*hun, self.mainScrollView.frame.origin.y-2, kScreenWidth/3-90, 2);
//        NSLog(@"%f",self.bottomView.frame.origin.x);
//    }
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIButton *btn = nil;
    if (scrollView == _mainScrollView) {
        NSInteger index = scrollView.contentOffset.x/kScreenWidth;
        btn = [self.view viewWithTag:index+50];
        [self bannerButtonClicked:btn];
    }
}
-(void)Setting
{
    NSLog(@"hello, world!");
}

-(void)Cliced:(UIButton *)sender
{
    NSLog(@"button cliced!");
}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    if ([otherGestureRecognize]&&self.mainScrollView.contentOffset.x=0) {
//        return NO;
//    }
//    return NO;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
