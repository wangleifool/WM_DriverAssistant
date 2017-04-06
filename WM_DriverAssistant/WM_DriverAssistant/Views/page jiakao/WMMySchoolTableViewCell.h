//
//  WMMySchoolTableViewCell.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMMySchool.h"

@interface WMMySchoolTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelSchoolRate;

@property (strong, nonatomic) WMMySchool *mySchool;

+ (instancetype)mySchoolCellWithTableView:(UITableView *)tableView;

@end
