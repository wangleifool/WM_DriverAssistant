//
//  WMPagesScrollView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/29.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MIN_SPACE 10
#define TOP_SPACE 0
#define TOP_SCROLL_VIEW_HEIGHT 40
#define LINE_BOTTOM_HEIGHT      3

#define SELECTED_COLOR   [UIColor colorWithRed:65/255.0 green:105/255.0 blue:225/255.0 alpha:1.0] //blue
#define UNSELECTED_COLOR [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]     //black
#define BACKGROUND_COLOR [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0]


@interface WMPagesScrollView : UIScrollView


//通过指定frame，每个page的title和每个page对应的视图控制器
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles withViewControllers:(NSArray *)vcs;

@end
