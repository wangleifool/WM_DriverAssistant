//
//  WMAdvertisementPagingScrollView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/8.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMAdvertisementPagingScrollView : UIView <UIScrollViewDelegate>
{
    UIPageControl *ADpageControl;
    UIScrollView  *ADscrollView;
}

@property (copy, nonatomic) NSMutableArray *advertisementImages;

@end
