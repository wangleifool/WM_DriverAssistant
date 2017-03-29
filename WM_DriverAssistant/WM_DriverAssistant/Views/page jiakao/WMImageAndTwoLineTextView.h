//
//  WMImageAndTwoLineTextView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMImageAndTwoLineTextView : UIView
@property (weak, nonatomic) IBOutlet UILabel *labelMainText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelDetailText;

@end
