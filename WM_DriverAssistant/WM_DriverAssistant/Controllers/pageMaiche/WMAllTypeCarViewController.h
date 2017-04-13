//
//  WMAllTypeCarViewController.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/12.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMAllTypeCarViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end
