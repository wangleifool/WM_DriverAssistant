//
//  WMAdvertisementPagingScrollView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/8.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMAdvertisementPagingScrollView.h"

@interface WMAdvertisementPagingScrollView ()
{
    NSTimer *timerScroll;
}
@end

@implementation WMAdvertisementPagingScrollView

//- (instancetype)init
//{
//    if (self = [super init]) {
//        
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        
//    }
//    return self;
//}

- (NSMutableArray *)advertisementImages
{
    if (nil == _advertisementImages) {
        _advertisementImages = [NSMutableArray array];
    }
    return _advertisementImages;
}

- (void)layoutSubviews
{
    if (0 != self.advertisementImages.count) {
        
        //为了实现无限滚动，我们往资源数组的第一和最后位置分别插入他应该展示的页面。 比如有页面： 1 2 3 4   当我们滑到4，继续滑，我们希望出现1。 类似，我们扩充资源数组. 4 1 2 3 4 1
        [self.advertisementImages insertObject:self.advertisementImages.lastObject atIndex:0];
        [self.advertisementImages addObject:self.advertisementImages[1]];
        
        //添加滚动视图
        ADscrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        ADscrollView.contentSize = CGSizeMake(self.bounds.size.width*self.advertisementImages.count, 0);
        ADscrollView.showsHorizontalScrollIndicator = NO;
        ADscrollView.pagingEnabled = YES;
        ADscrollView.delegate = self;
        [self addSubview:ADscrollView];
        
        //加载滚动视图的内容视图
        for (NSInteger i = 0; i < self.advertisementImages.count; i++) {
            CGRect frame = CGRectMake(i*ADscrollView.bounds.size.width, 0, ADscrollView.bounds.size.width, ADscrollView.bounds.size.height);
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
            [imageView setImage:self.advertisementImages[i]];
            
            [ADscrollView addSubview:imageView];
        }
        [ADscrollView setContentOffset:CGPointMake(ADscrollView.bounds.size.width, 0) animated:NO];
        
        //添加页面控制
        ADpageControl = [[UIPageControl alloc] init];
        ADpageControl.frame = CGRectMake(0, self.bounds.size.height - ADpageControl.bounds.size.height, self.bounds.size.width, ADpageControl.bounds.size.height);
        ADpageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        ADpageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        ADpageControl.numberOfPages = self.advertisementImages.count - 2;  //因为有两个元素是故意添加的。
        [ADpageControl addTarget:self action:@selector(pageControlPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ADpageControl];
        
        
        [self startTimer];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / ADscrollView.bounds.size.width;
    
    //如果页面滑倒了，我们设置的 零界切换视图。 那么需要立即更改scrollView正确的contentoffset
    if (page == 0) {
        ADpageControl.currentPage = self.advertisementImages.count - 2;
        [ADscrollView setContentOffset:CGPointMake((self.advertisementImages.count - 2)*ADscrollView.bounds.size.width, 0) animated:NO];
    } else if (page == self.advertisementImages.count - 1) {
        ADpageControl.currentPage = 0;
        [ADscrollView setContentOffset:CGPointMake(ADscrollView.bounds.size.width, 0) animated:NO];
    } else {
        ADpageControl.currentPage = page - 1;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)pageControlPressed:(id)sender
{
    
}

#pragma mark - 定时器
- (void)nextPage
{
    NSInteger newPage = ADpageControl.currentPage + 1;
    [ADscrollView setContentOffset:CGPointMake(ADscrollView.bounds.size.width * (newPage+1), 0) animated:YES]; //newPage 需要加一，因为第一个视图是我们额外添加的视图。他的宽度应该去除
    [self scrollViewDidEndDecelerating:ADscrollView];
}

- (void)startTimer
{
    dispatch_async(dispatch_queue_create("playStatusTimer", NULL), ^{
        if (nil == timerScroll) {
            timerScroll = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:timerScroll forMode:NSDefaultRunLoopMode];
            [[NSRunLoop currentRunLoop] run];
        }

    });
}

- (void)stopTimer
{
    if (timerScroll) {
        [timerScroll invalidate];
        timerScroll = nil;
    }
}

@end
