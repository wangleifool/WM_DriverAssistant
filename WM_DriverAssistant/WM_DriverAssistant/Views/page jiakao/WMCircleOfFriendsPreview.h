//
//  WMCircleOfFriendsPreview.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMCircleOfFriendsPreview : UIView

@property (weak, nonatomic) IBOutlet UIView *viewOfTopicFriends;
@property (weak, nonatomic) IBOutlet UILabel *titleOfCircleFriendsPreview;
@property (weak, nonatomic) IBOutlet UILabel *titleOfHuatiCount;
@property (weak, nonatomic) IBOutlet UILabel *titleOfKaoyouCount;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconOfFriendsImageViews;


@property (weak, nonatomic) IBOutlet UIView *viewOfTopicConversation;
@property (weak, nonatomic) IBOutlet UIButton *buttonOfTopicConversation;

@end
