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
#define LINE_BOTTOM_HEIGHT      2




@interface WMPagesScrollView : UIScrollView

@property (strong,nonatomic) UIViewController *rootVC;

//通过指定frame，每个page的title和每个page对应的视图控制器
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles withViewControllers:(NSArray *)vcs;

@end
