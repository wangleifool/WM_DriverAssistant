//
//  WMSubjectTwoPracticeTableViewCell.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDButton.h"

@class WMSubjectTwoPracticeTableViewCell;

@protocol WMSubjectTwoPracticeTableViewCellDelegate <NSObject>

- (void)touchUpActionOfPracticeTableViewCellOutlet:(id)sender;

@end

@interface WMSubjectTwoPracticeTableViewCell : UITableViewCell <HDButtonDelegate>


@property (weak, nonatomic) IBOutlet UIButton *topImageBtView;
@property (weak, nonatomic) IBOutlet HDButton *btSinglePractice;
@property (weak, nonatomic) IBOutlet HDButton *btExamSecret;
@property (weak, nonatomic) IBOutlet HDButton *btAwardDrive;
@property (weak, nonatomic) IBOutlet HDButton *btStudentWelfare;

@property (strong, nonatomic) id <WMSubjectTwoPracticeTableViewCellDelegate> delegate;

+ (instancetype)cellWithTableview:(UITableView *)tableview withSubjectIndex:(NSInteger)index;
@end
