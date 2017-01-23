//
//  WMExamPracticeViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMExamPracticeViewController.h"
#import "WMexamPracticeToolBarView.h"

@interface WMExamPracticeViewController () <WMexamPracticeToolBarViewDelegate>
{
    WMexamPracticeToolBarView *bottomIndicateToolBar;
}
@end

@implementation WMExamPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //toolbar视图分为上下两部分，初始只显示上面的部分。
    CGRect frameOfToolBar = CGRectMake(0, ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR, self.view.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR+HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR);
    bottomIndicateToolBar = [[WMexamPracticeToolBarView alloc] initWithFrame:frameOfToolBar];
    [self.view addSubview:bottomIndicateToolBar];
    bottomIndicateToolBar.delegate = self;
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
