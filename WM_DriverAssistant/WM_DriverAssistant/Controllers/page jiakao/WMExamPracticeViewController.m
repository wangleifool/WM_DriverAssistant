//
//  WMExamPracticeViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMExamPracticeViewController.h"
#import "WMexamPracticeToolBarView.h"

@interface WMExamPracticeViewController ()

@end

@implementation WMExamPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    CGRect frameOfToolBar = CGRectMake(0, ScreenHeight - 64, self.view.frame.size.width, 64);
    WMexamPracticeToolBarView *toolBar = [[WMexamPracticeToolBarView alloc] initWithFrame:frameOfToolBar];
    [self.view addSubview:toolBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
