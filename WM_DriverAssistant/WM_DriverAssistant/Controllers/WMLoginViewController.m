//
//  WMLoginViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/11/11.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMLoginViewController.h"

@interface WMLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfiledPhone;
@property (weak, nonatomic) IBOutlet UITextField *textfiledCode;
@end

@implementation WMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btDismiss:(id)sender {
    
    [self.textfiledCode resignFirstResponder];
    [self.textfiledPhone resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btLogin:(id)sender {
    [self btDismiss:nil];
}

- (IBAction)btSendPhoneCode:(id)sender {
    
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
