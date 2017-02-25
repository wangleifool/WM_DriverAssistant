//
//  WMexamAnswerCellTableViewCell.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMAutoBreakLineLabel.h"

@interface WMexamAnswerCellTableViewCell : UITableViewCell

@property (assign, nonatomic) BOOL isRightAnswer;
@property (weak, nonatomic) IBOutlet UILabel *labelAnserIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelAnswerContent;

+ (instancetype)answerCellWithTableView:(UITableView *)tableview;
- (void)updateLabelAnswerIndexText:(NSString *)text;

@end
