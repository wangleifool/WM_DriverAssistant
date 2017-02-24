//
//  WMExamPracticeViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMExamPracticeViewController.h"
#import "WMexamPracticeToolBarView.h"
#import "WMexamPracticeContentView.h"
#import "WMappDatabase.h"

@interface WMExamPracticeViewController () <WMexamPracticeToolBarViewDelegate>
{
    WMexamPracticeToolBarView *bottomIndicateToolBar;
    WMexamPracticeContentView *topMainContentView;
}

//内容视图相关属性
/**  */
@property(nonatomic,strong)UIView *leftView;
/**  */
@property(nonatomic,strong)UIView *centerView;
/**  */
@property(nonatomic,strong)UIView *rightView;

@property(nonatomic,assign)CGPoint   start;
@property(nonatomic,assign)NSInteger questionIndex;

@property(nonatomic,assign) BOOL isLeftViewShadow;
@property(nonatomic,assign) BOOL isCenterViewShadow;

@end

@implementation WMExamPracticeViewController

-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
    }
    return _leftView;
}
-(UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
    }
    return _centerView;
}
-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
    }
    return _rightView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //toolbar视图分为上下两部分，初始只显示上面的部分。
    CGRect frameOfToolBar = CGRectMake(0, self.view.frame.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR, self.view.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR+HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR);
    bottomIndicateToolBar = [[WMexamPracticeToolBarView alloc] initWithFrame:frameOfToolBar];
    [self.view addSubview:bottomIndicateToolBar];
    bottomIndicateToolBar.delegate = self;
    
    //题目显示区域,类似翻页卡片
    CGRect frameOfMainContent = CGRectMake(0, NavBarHeight7, self.view.frame.size.width, self.view.frame.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - NavBarHeight7);
    NSArray *allQuestion = [WMappDatabase getAllExamQuestion];
    topMainContentView = [[WMexamPracticeContentView alloc] initWithFrame:frameOfMainContent withData:allQuestion]; //暂时没有提供数据
    [self.view addSubview:topMainContentView];
    [self.view sendSubviewToBack:topMainContentView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - WMexamPracticeToolBarViewDelegate
- (void)touchUpInsideOfToolBar:(WMexamPracticeToolBarView *)toolBar
{
//    CGRect frame = bottomIndicateToolBar.frame;
//    frame.origin.y -= HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
//    frame.size.height += HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
//    bottomIndicateToolBar.frame = frame;
    
}

- (void)touchUpInsideOfCollect:(WMexamPracticeToolBarView *)toolBar
{
    
}

@end
