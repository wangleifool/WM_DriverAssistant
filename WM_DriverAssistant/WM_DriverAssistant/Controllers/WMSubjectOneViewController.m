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
#import "WMTheoryLearnModelView.h"
#import "WMCircleOfFriendsPreview.h"
#import "WMBeginnerBuyCarView.h"

@interface WMSubjectOneViewController () <WMMyDriverMasterViewDelegate,WMTheoryLearnModelViewDelegate>
{    
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet WMMyDriverMasterView *driverMasterView;
@property (weak, nonatomic) IBOutlet WMAdvertisementPagingScrollView *advertisementView;
@property (weak, nonatomic) IBOutlet WMTheoryLearnModelView *theoryLearnView;
@property (weak, nonatomic) IBOutlet WMCircleOfFriendsPreview *circleOfFriendsPreview;
@property (weak, nonatomic) IBOutlet WMBeginnerBuyCarView *beginnerBuyCarView;

@end

@implementation WMSubjectOneViewController

- (void)viewDidLayoutSubviews
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //滚动广告
    [self.advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang01"]];
    [self.advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang02"]];
    [self.advertisementView.advertisementImages addObject:[UIImage imageNamed:@"touxiang03"]];
    
    //添加我的教练视图
    self.driverMasterView.delegate = self;
   
    //理论学习模块
    self.theoryLearnView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    self.mainScrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height*2);
    CGFloat contentHeight = self.driverMasterView.bounds.size.height + 8 + self.advertisementView.bounds.size.height + 8 + self.theoryLearnView.bounds.size.height + 8 + self.circleOfFriendsPreview.bounds.size.height + 8 + self.beginnerBuyCarView.bounds.size.height + 64; // 计算有问题
    self.mainScrollView.contentSize = CGSizeMake(0, contentHeight);

}

#pragma mark - 教练视图代理
- (void)actionOfTapMyDriverMasterView:(WMMyDriverMasterView *)MyDvierMasterview
{
    NSLog(@"get view :%@",MyDvierMasterview);
}

#pragma mark - 理论学习视图代理
- (void)touchUpActionOfTheoryLearnViewOutlet:(id)sender
{
    if ([self.theoryLearnView.btSubjectTech isEqual:sender]) {
        NSLog(@"1");
    } else if ([self.theoryLearnView.btIconRemember isEqual:sender]) {
        NSLog(@"2");
    } else if ([self.theoryLearnView.btAwardTryDrive isEqual:sender]) {
        NSLog(@"3");
    } else if ([self.theoryLearnView.btStudentWelfare isEqual:sender]) {
        NSLog(@"4");
    } else if ([self.theoryLearnView.btShuffleTraining isEqual:sender]) {
        NSLog(@"5");
    } else if ([self.theoryLearnView.btSpecificTraning isEqual:sender]) {
        NSLog(@"6");
    } else if ([self.theoryLearnView.btHardQuestions isEqual:sender]) {
        NSLog(@"7");
    } else if ([self.theoryLearnView.btNoneLearnQuestions isEqual:sender]) {
        NSLog(@"8");
    } else if ([self.theoryLearnView.btSortTraining isEqual:sender]) {
        NSLog(@"9");
    } else if ([self.theoryLearnView.btBeforeTest isEqual:sender]) {
        NSLog(@"10");
    } else if ([self.theoryLearnView.btLearnRate isEqual:sender]) {
        NSLog(@"11");
    } else if ([self.theoryLearnView.btVipPass isEqual:sender]) {
        NSLog(@"12");
    } else if ([self.theoryLearnView.btTestDate isEqual:sender]) {
        NSLog(@"13");
    } else if ([self.theoryLearnView.btSimulationTest isEqual:sender]) {
        NSLog(@"14");
    } else if ([self.theoryLearnView.btMistakeQuestions isEqual:sender]) {
        NSLog(@"15");
    } else if ([self.theoryLearnView.btFavoriteQuestions isEqual:sender]) {
        NSLog(@"16");
    } else if ([self.theoryLearnView.btLearnLog isEqual:sender]) {
        NSLog(@"17");
    } else if ([self.theoryLearnView.btEarnCoin isEqual:sender]) {
        NSLog(@"18");
    }
}

@end
