//
//  WMSubjectTwoThreeExamItemTableViewCell.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/6.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMModelOfExamItem.h"

@interface WMSubjectTwoThreeExamItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewOfExamItem;
@property (weak, nonatomic) IBOutlet UILabel *labelOfExamTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelOfPassPercent;
@property (weak, nonatomic) IBOutlet UILabel *labelOfExamDescription;
@property (weak, nonatomic) IBOutlet UIButton *labelBtOfBrowseCount;
@property (weak, nonatomic) IBOutlet UIButton *labelBtOfConversationCount;
@property (weak, nonatomic) IBOutlet UIButton *labelBtOfVideoCount;

@property (strong, nonatomic) WMModelOfExamItem *modelExamItem;

+ (instancetype)examItemCellWithTableView:(UITableView *)tableView;
@end
