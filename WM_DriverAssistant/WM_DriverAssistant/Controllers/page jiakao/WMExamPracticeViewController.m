//
//  WMExamPracticeViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMExamPracticeViewController.h"
//#import "WMexamPracticeToolBarView.h"
#import "WMexamPracticeContentView.h"
#import "WMappDatabase.h"

@interface WMExamPracticeViewController ()
{
//    WMexamPracticeToolBarView *bottomIndicateToolBar;
    WMexamPracticeContentView *topMainContentView;
}


@end

@implementation WMExamPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
//    //toolbar视图分为上下两部分，初始只显示上面的部分。
//    CGRect frameOfToolBar = CGRectMake(0, self.view.frame.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR, self.view.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR+HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR);
//    bottomIndicateToolBar = [[WMexamPracticeToolBarView alloc] initWithFrame:frameOfToolBar];
//    [self.view addSubview:bottomIndicateToolBar];
//    bottomIndicateToolBar.delegate = self;
    
    //题目显示区域,类似翻页卡片
    CGRect frameOfMainContent = CGRectMake(0, NavBarHeight7, self.view.frame.size.width, self.view.frame.size.height - NavBarHeight7);
    NSArray *allQuestion = [WMappDatabase getAllExamQuestion];
    topMainContentView = [[WMexamPracticeContentView alloc] initWithFrame:frameOfMainContent withData:allQuestion]; //暂时没有提供数据
    [self.view addSubview:topMainContentView];
    [self.view sendSubviewToBack:topMainContentView];
    
    [self configureNavigationBar];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureNavigationBar
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    [self configureNavigationBarLeftView];
    [self configureNavigationCenterView];
}

- (void)configureNavigationBarLeftView
{
//    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonPressed:)];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonPressed:)];
    
    UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedButton.width = -15;
    
    self.navigationItem.leftBarButtonItems = @[fixedButton,leftBarButton];
}

- (void)leftBarButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configureNavigationCenterView
{
    UISegmentedControl *segMent = [[UISegmentedControl alloc] initWithItems:@[@"答题模式",@"背题模式"]];
    segMent.selectedSegmentIndex = 0;
    [segMent addTarget:topMainContentView action:@selector(practiceModeChange:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segMent;
}


@end
