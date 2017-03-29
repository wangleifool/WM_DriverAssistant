//
//  WMMyDriverMasterView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TEXT_TITLE_BINDING_OK @"我的教练(已绑定)🎉"
#define TEXT_DESC_BINDING_OK @"绑定教练同步成绩，优先安排考试"
#define TEXT_TITLE_BINDING_NOTOK @"我的教练(未绑定)🎁"
#define TEXT_DESC_BINDING_NOTOK @"绑定教练同步成绩，优先安排考试"

@class WMMyDriverMasterView;

@protocol WMMyDriverMasterViewDelegate <NSObject>

@required
- (void)actionOfTapMyDriverMasterView:(WMMyDriverMasterView *)MyDvierMasterview;
@end

@interface WMMyDriverMasterView : UIView

@property (strong, nonatomic) id<WMMyDriverMasterViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSulpture;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;


@property (strong, nonatomic) id modelOfDriverMaster;  //待后期添加教练模型
@property (assign, nonatomic) BOOL isBindingDriverMaster;


@end
