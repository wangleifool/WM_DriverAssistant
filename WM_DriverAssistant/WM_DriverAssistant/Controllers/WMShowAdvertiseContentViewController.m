    //
//  WMShowAdvertiseContentViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/18.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMShowAdvertiseContentViewController.h"

@interface WMShowAdvertiseContentViewController ()
{
    NSString *webURL;
}

@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation WMShowAdvertiseContentViewController

- (instancetype)initWithWebURL:(NSString *)url
{
    if (self = [super init]) {
        self = [[WMShowAdvertiseContentViewController alloc] initWithNibName:@"WMShowAdvertiseContentViewController" bundle:nil];
        webURL = url;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *URL = [NSURL URLWithString:webURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [self.mainWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
