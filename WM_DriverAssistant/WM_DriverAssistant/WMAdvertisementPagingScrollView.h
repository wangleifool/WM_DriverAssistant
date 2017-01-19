//
//  WMAdvertisementPagingScrollView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/8.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMAdvertisementPagingScrollView;

@protocol WMAdvertisementPagingScrollViewDelegate <NSObject>

- (void)advertiseTouchEventWithNeedWebURL:(NSString *)url;

@end

@interface WMAdvertisementPagingScrollView : UIView <UIScrollViewDelegate>
{
    UIPageControl *ADpageControl;
    UIScrollView  *ADscrollView;
}

@property (strong, nonatomic) id <WMAdvertisementPagingScrollViewDelegate> delegate;
@property (copy, nonatomic) NSMutableArray *advertisementImages;
@property (copy, nonatomic) NSMutableArray *modelOfAdvertisements;

@end
