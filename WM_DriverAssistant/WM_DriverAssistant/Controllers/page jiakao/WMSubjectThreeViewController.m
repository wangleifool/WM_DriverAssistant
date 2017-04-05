//
//  WMSubjectThreeViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMSubjectThreeViewController.h"

@interface WMSubjectThreeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation WMSubjectThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_label setText:@"test content"];
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
