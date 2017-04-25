//
//  WMBasicNavViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBasicNavViewController.h"
#import "WMNavigationView.h"
#import "WMLeftView.h"
#import "WMCitySelectController.h"
#import <CoreLocation/CoreLocation.h>

@interface WMBasicNavViewController ()<UITableViewDelegate,UITableViewDataSource,WMNavigationBarDelegate,CLLocationManagerDelegate>

@property (nonatomic,strong)NSMutableArray      *items;

@property (nonatomic,strong)WMLeftView          *leftView;
@property (nonatomic,strong)UIView              *headerView;
@property (nonatomic,strong)CLLocationManager   *locationMg;
@property (nonatomic,strong)NSString            *cityName;


@end

@implementation WMBasicNavViewController

#pragma mark - 懒加载
-(NSMutableArray *)items
{
    if (!_items) {
        YCXMenuItem *item1 = [YCXMenuItem menuItem:@"消息" image:nil tag:100 userInfo:nil];
        YCXMenuItem *item2 = [YCXMenuItem menuItem:@"驾考大作战" image:nil tag:101 userInfo:nil];
        YCXMenuItem *item3 = [YCXMenuItem menuItem:@"学车签到" image:nil tag:102 userInfo:nil];
        item1.foreColor = [UIColor blackColor];
        item2.foreColor = [UIColor blackColor];
        item3.foreColor = [UIColor blackColor];
        _items = [@[item1,item2,item3] mutableCopy];
    }
    return _items;
}
-(WMLeftView *)leftView
{
    if (!_leftView) {
        _leftView = [[WMLeftView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStylePlain];
        _leftView.delegate = self;
        _leftView.dataSource = self;
    }
    return _leftView;
}
-(WMNavigationView *)navView
{
    if (!_navView) {
        _navView = (WMNavigationView *)[WMNavigationView WMNavagationBar];
        _navView.frame = CGRectMake(0, 0, kScreenWidth, _navView.bounds.size.height);
        _navView.delegate = self;
    }
    return _navView;
}
-(UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:self.view.frame];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:self.navView];
    }
    return _contentView;
}
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        _headerView.backgroundColor = [UIColor whiteColor];
        UILabel *loginL = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 80, 30)];
        loginL.textColor = [UIColor blueColor];
        loginL.text = @"立即登陆";
        [_headerView addSubview:loginL];
    }

    return _headerView;
}
-(CLLocationManager *)locationMg
{
    if (!_locationMg) {
        _locationMg = [[CLLocationManager alloc] init];
        _locationMg.delegate = self;
        _locationMg.desiredAccuracy = kCLLocationAccuracyBest;
        _locationMg.distanceFilter = 10;
    }
    return _locationMg;
}
-(void)location
{
    if ([self.locationMg respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationMg requestAlwaysAuthorization];
    }
    [self.locationMg startUpdatingLocation];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = [UIScreen mainScreen].bounds;
    self.tableView.hidden = YES;
    [self location];
    _userColum = @[@"我的题库",@"我的驾校",@"同步数据",@"下载科二、科三视频",@"题库更新",@"我的订单",@"赚取金币",@"设置"];
    self.leftView.tableHeaderView = self.headerView;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.contentView];
    
    //[self configureNavigaitonBar];
    UIPanGestureRecognizer *swip = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView:)];
    //swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.contentView addGestureRecognizer:swip];
    UITapGestureRecognizer *swipL = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftView)];
    //swipL.numberOfTouches = 1;
    //swipL.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.contentView addGestureRecognizer:swipL];
//    [self.view addGestureRecognizer:gs];
    showLeftView = true;
    
    self.navView.userBtn.layer.cornerRadius = 23;
    self.navView.userBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.navView.userBtn.layer.borderWidth = 2;
    self.navView.userBtn.layer.masksToBounds = YES;
    self.navView.locationBtn.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    [self reverseGeogecode:location];
    [self.locationMg stopUpdatingLocation];
}
#pragma mark - 反地理编码
-(void)reverseGeogecode:(CLLocation *)location
{
    CLGeocoder *geocode = [[CLGeocoder alloc] init];
    [geocode reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error){
        CLPlacemark *firstPlaceMark = [placemarks firstObject];
        [self.navView.locationBtn setTitle:firstPlaceMark.locality forState:UIControlStateNormal];
    }];
}
#pragma mark - 自定义导航栏
- (void)configureNavigaitonBar
{
    //设置导航栏背景颜色
    [self setNavigationBarImage:@""];
    
    //自定义左边的tab item
    //[self setNavigationLeftbutton:@"icon_bm_peilian.png" sel:@selector(addView)];
    //[self setNavigationRightbutton:nil sel:@selector(popView:)];
    
    //自定义右边的tab item
    //[self setNavigationRightView:nil sel:nil];
    
    //自定义title视图，该方法需要子类重载（不同的页面，显示不同）
    //[self setNavigationTitleView:nil];
    
}
-(void)popView:(id)sender
{
    if (sender != self.navigationItem.rightBarButtonItem) {
        [YCXMenu setTintColor:[UIColor lightGrayColor]];
        [YCXMenu setSelectedColor:[UIColor blueColor]];
        if ([YCXMenu isShow]) {
            [YCXMenu dismissMenu];
        }
        else
        {
            [YCXMenu showMenuInView:self.view fromRect:CGRectMake(self.view.frame.size.width-60, 64, 50, 0) menuItems:self.items selected:^(NSInteger index, YCXMenuItem *item){
                switch (item.tag) {
                    case 100:
                        NSLog(@"News!");
                        break;
                    case 101:
                        NSLog(@"驾考！");
                        break;
                    case 102:
                        NSLog(@"签到!");
                        break;
                    default:
                        break;
                }
            }];
        }
    }
}
#pragma mark - WMNavigationBarDelegate
-(void)WMNavigationBar:(WMNavigationView *)navigationView showLeftViewWith:(UIButton *)button
{
    [self openLeftView];
}
-(void)WMNavigationBar:(WMNavigationView *)navigationView messageWith:(UIButton *)button
{
    [self popView:button];
}
-(void)WMNavigationBar:(WMNavigationView *)navigationView locationWith:(UIButton *)button
{
    WMCitySelectController *citySelectVC = [[WMCitySelectController alloc] init];
    citySelectVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:citySelectVC animated:YES];
}
#pragma mark 左边按钮按下
-(void)openLeftView
{
    if (showLeftView)
    {
        showLeftView = false;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.contentView.center = CGPointMake(self.contentView.center.x+kScreenWidth*0.8, self.contentView.center.y);
            self.UserView.alpha = self.contentView.frame.origin.x/kScreenWidth*0.8;
        }];
    }
    else
    {
        [self hideLeftView];
    }
}
#pragma mark 显示左边用户视图
-(void)ShowLeftView:(UIPanGestureRecognizer *)panGesture
{
    CGPoint transation = [panGesture translationInView:self.view];
    if (transation.x > 0) {
        self.contentView.center = CGPointMake(self.view.center.x+transation.x, self.contentView.center.y);
        self.UserView.alpha = self.contentView.center.x/kScreenWidth*0.8;
    }
    if (panGesture.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (transation.x < kScreenWidth*0.8*0.5) {
                showLeftView = YES;
                self.contentView.center = CGPointMake(self.view.center.x, self.contentView.center.y);
            }
            else
            {
                self.contentView.center = CGPointMake(self.view.center.x+kScreenWidth*0.8, self.contentView.center.y);
                showLeftView = NO;
            }
        } completion:nil];
        
        
    }
    
}
#pragma mark 隐藏左边视图
-(void)hideLeftView
{
    showLeftView = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.center = CGPointMake(self.view.center.x, self.contentView.center.y);
        self.UserView.alpha = self.contentView.frame.origin.x/kScreenWidth*0.8;
    }];
    //self.contentView.userInteractionEnabled = YES;
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
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted = NO;
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        item = [[UIBarButtonItem alloc] initWithCustomView:btn];
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
#pragma mark - UITableViewHeaderView

#pragma mark - UITableViewDelegate && UITableViewDatasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _userColum.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor blueColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [self.userColum objectAtIndex:indexPath.row];
    return cell;
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
