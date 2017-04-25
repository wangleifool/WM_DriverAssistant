//
//  WMSubjectTwoViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMSubjectTwoViewController.h"
#import "WMMyDriverMasterView.h"

#import "WMSubjectTwoPracticeTableViewCell.h"
#import "WMMySchoolTableViewCell.h"
#import "WMModelOfExamItem.h"
#import "WMSubjectTwoThreeExamItemTableViewCell.h"

#define Section_Practice 0
#define Section_MySchool 1
#define Section_ExamItems 2
#define Section_ExamSkills 3
#define Section_CycleOfFriends 4
#define Section_BuyCar  5

@interface WMSubjectTwoViewController () <WMMyDriverMasterViewDelegate,UITableViewDelegate,UITableViewDataSource,WMSubjectTwoPracticeTableViewCellDelegate>
{
    WMMyDriverMasterView *driverMasterView;
    
    NSArray *examItems;
}

@end

@implementation WMSubjectTwoViewController

//- (void)loadView
//{
//    [super loadView];
//    
//    [self getSubject2ItemsData];
//}

- (void)viewDidLoad {
    
    [self getSubject2ItemsData];
    
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    NSLog(@"subject 2 view will appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"subject 2 view did appear");
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionOfTapMyDriverMasterView:(WMMyDriverMasterView *)MyDvierMasterview
{

}

- (void)reloadData
{
    if ([self.view isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self.view;
        [tableView reloadData];
    }
}

#pragma mark - 获取数据
- (void)getSubject2ItemsData
{
    //启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //前面写服务器给的域名，后面拼接上需要提交的参数，假如参数是key=1
    NSString *domainStr = @"https://sirius.kakamobi.cn/api/open/exam-project/list.htm?_a=2wy9wAxvVAwy7Vz404V635zVw5z3z6790322&_appName=jiakaobaodianxingui&_appUser=03fbeaeb4f65146bf6cea851f45841ca&_cityCode=510100&_cityName=%E6%88%90%E9%83%BD%E5%B8%82&_device=KOBE%20use%20iPad&_firstTime=2017-03-31%2008%3A49%3A30&_gpsCity=510100&_gpsType=baidu&_html5=false&_imei=549af8c6669249e19516b3303d5cdd284ec672ca&_j=1.0&_jail=false&_latitude=30.67943289807245&_launch=5&_longitude=103.797371602262&_mac=549af8c6669249e19516b3303d5cdd284ec672ca&_manufacturer=Apple&_network=wifi&_operator=N&_pkgName=cn.mucang.ios.jiakaobaodianPromise&_platform=iphone&_product=%E9%A9%BE%E8%80%83%E5%AE%9D%E5%85%B8%E6%96%B0%E8%A7%84&_productCategory=jiakaobaodian&_r=a64a03026aaff90f16f3e227ecaa1b34&_renyuan=mucang&_screenDip=1&_screenHeight=1024&_screenWidth=768&_system=iPhone%20OS&_systemVersion=9.3.5&_u=w9x69536V0A0xVz483V4w3zV94x7x9v62234&_userCity=510100&_vendor=appstore&_version=6.6.10&_webviewVersion=4.7&cursor=0&kemu=2&pageSize=100&schoolCode=510100030&schoolName=%E6%88%90%E9%91%AB%E9%A9%BE%E6%A0%A1&tiku=car&sign=941ac9e184b0701830316848fe33e7c3";
//    domainStr = [domainStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *domainStr = @"https://sirius.kakamobi.cn/api/open/exam-project/list.htm";
    
//    NSDictionary *parameters = @{@"_a":@"2wy9wAxvVAwy7Vz404V635zVw5z3z6790322",
//                                 @"_appName":@"jiakaobaodianxingui",
//                                 @"_appUser":@"03fbeaeb4f65146bf6cea851f45841ca",
//                                 @"_cityCode":@"510100",
//                                 @"_cityName":@"成都市",
//                                 @"_device":@"KOBE use iPad",
//                                 @"_firstTime":@"2017-03-31 08:49:30",
//                                 @"_gpsCity":@"510100",
//                                 @"_gpsType":@"baidu",
//                                 @"_html5":@"false",
//                                 @"_imei":@"549af8c6669249e19516b3303d5cdd284ec672ca",
//                                 @"_j":@"1.0",
//                                 @"_jail":@"false",
//                                 @"_latitude":@"30.67943289807245",
//                                 @"_launch":@"5",
//                                 @"_longitude":@"103.797371602262",
//                                 @"_mac":@"549af8c6669249e19516b3303d5cdd284ec672ca",
//                                 @"_manufacturer":@"Apple",
//                                 @"_network":@"wifi",
//                                 @"_operator":@"N",
//                                 @"_pkgName":@"cn.mucang.ios.jiakaobaodianPromise",
//                                 @"_platform":@"iphone",
//                                 @"_product":@"驾考宝典新规",
//                                 @"_productCategory":@"jiakaobaodian",
//                                 @"_r":@"a64a03026aaff90f16f3e227ecaa1b34",
//                                 @"_renyuan":@"mucang",
//                                 @"_screenDip":@"1",
//                                 @"_screenHeight":@"1024",
//                                 @"_screenWidth":@"768",
//                                 @"_system":@"iPhone OS",
//                                 @"_systemVersion":@"9.3.5",
//                                 @"_u":@"w9x69536V0A0xVz483V4w3zV94x7x9v62234",
//                                 @"_userCity":@"510100",
//                                 @"_vendor":@"appstore",
//                                 @"_version":@"6.6.10",
//                                 @"_webviewVersion":@"4.7",
//                                 @"cursor":@"0",
//                                 @"kemu":@"2",
//                                 @"pageSize":@"100",
//                                 @"schoolCode":@"510100030",
//                                 @"schoolName":@"成鑫驾校",
//                                 @"tiku":@"car",
//                                 @"sign":@"941ac9e184b0701830316848fe33e7c3"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明请求的数据是json类型
//    manager.requestSerializer  = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
       
    //以GET的形式提交，只需要将上面的请求地址给GET做参数就可以
    [manager GET:domainStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"AFnetworking get succ!");
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //json解析
        if ([responseObject isKindOfClass:[NSArray class]]) {
            examItems = [WMModelOfExamItem mj_objectArrayWithKeyValuesArray:responseObject];
        } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray *arrayOfItemList = [[responseObject objectForKey:@"data"] objectForKey:@"itemList"];
            examItems = [WMModelOfExamItem mj_objectArrayWithKeyValuesArray:arrayOfItemList];
            
            [self reloadData];
            
        } else if ([responseObject isKindOfClass:[NSString class]]) {
        
        } else {
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"AFnetworking get fail!  %@",error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    
}

#pragma mark - 考试项目详解 表视图
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case Section_Practice:
            rows = 1;
            break;
        case Section_MySchool:
            rows = 1;
            break;
        case Section_ExamItems:
        {
            if (examItems)
                rows = [examItems count];
        }
            break;
        case Section_ExamSkills:
            rows = 1;
            break;
        case Section_CycleOfFriends:
            rows = 1;
            break;
        case Section_BuyCar:
            rows = 1;
            break;
        default:
            break;
    }
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case Section_Practice:
        {
            WMSubjectTwoPracticeTableViewCell *cell = [WMSubjectTwoPracticeTableViewCell cellWithTableview:tableView withSubjectIndex:2];
            cell.delegate = self;
            
            return cell;
        }
            break;
        case Section_MySchool:
        {
            WMMySchoolTableViewCell *cell = [WMMySchoolTableViewCell mySchoolCellWithTableView:tableView];
            return cell;
        }
            break;
        case Section_ExamItems:
        {
            WMSubjectTwoThreeExamItemTableViewCell *cell = [WMSubjectTwoThreeExamItemTableViewCell examItemCellWithTableView:tableView];
            cell.modelExamItem = [examItems objectAtIndex:indexPath.row];
            
            return cell;
        }
            break;
        case Section_ExamSkills:
            
            break;
        case Section_CycleOfFriends:
            
            break;
        case Section_BuyCar:
            
            break;
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Subject2ExamItemCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Subject2ExamItemCell"];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"cell %ld",indexPath.row]];
    
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 44.0;
    switch (indexPath.section) {
        case Section_Practice:
            height = 154;
            break;
        case Section_ExamItems:
            height = 84;
            break;
        default:
            break;
    }
    return height;
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    CGFloat headerViewHeight = 0.01;
    switch (section) {
        case Section_ExamItems:
            headerViewHeight = 20;
            break;
            
        default:
            break;
    }
    return headerViewHeight;//section头部高度
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    CGFloat headerViewHeight = 1;
    switch (section) {
        case Section_ExamItems:
        {
            headerViewHeight = 20;
            view.frame = CGRectMake(0, 0, ScreenWidth, headerViewHeight);
            view.backgroundColor = [UIColor whiteColor];
            UILabel *labelOfSectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 4, view.frame.size.width - 8, 16)];
            labelOfSectionTitle.textAlignment = NSTextAlignmentLeft;
            [labelOfSectionTitle setText:@"考试项目详解"];
            [view addSubview:labelOfSectionTitle];
        }
            break;
            
        default:
        {
            view.frame = CGRectMake(0, 0, ScreenWidth, headerViewHeight);
            view.backgroundColor = [UIColor clearColor];
        }
            break;
    }
    
    
    return view;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - WMsubject practice cell delegate
- (void)touchUpActionOfPracticeTableViewCellOutlet:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:Section_Practice];
    UITableView *mainTableView = (UITableView *)self.view;
    WMSubjectTwoPracticeTableViewCell *cell = [mainTableView cellForRowAtIndexPath:indexPath];
    if ([sender isEqual:cell.topImageBtView]) {
        NSLog(@"你点击了 练习组的 图片按钮");
    } else if ([sender isEqual:cell.btSinglePractice]) {
        NSLog(@"你点击了 单项联系");
    } else if ([sender isEqual:cell.btExamSecret]) {
        NSLog(@"你点击了 考试秘笈");
    } else if ([sender isEqual:cell.btAwardDrive]) {
        NSLog(@"你点击了 试驾");
    } else if ([sender isEqual:cell.btStudentWelfare]) {
        NSLog(@"你点击了 学员福利");
    }
    
    UIViewController *vc = [[UIViewController alloc] init];
    [vc.view setBackgroundColor:[UIColor greenColor]];
    
    [self.parentViewController.navigationController pushViewController:vc animated:YES];
    self.parentViewController.navigationController.navigationBarHidden = NO;
}
@end
