//
//  WMPresentViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/25.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMPresentViewController.h"
#import <UIKit/UIKit.h>

@interface WMPresentViewController () <UIViewControllerAnimatedTransitioning>

@end

@implementation WMPresentViewController

/** 定义动画时间 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

/** 定义动画效果 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //转场的容器图，动画完成之后会消失
    UIView *containerView =  [transitionContext containerView];
    UIView *fromView = nil;
    UIView *toView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else{
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    //对应关系
    BOOL isPresent = (toViewController.presentingViewController == fromViewController);
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect toFrame = [transitionContext finalFrameForViewController:toViewController];
    
    if (isPresent) {
        fromView.frame = fromFrame;
        toView.frame = CGRectOffset(toFrame, toFrame.size.width, 0);
        [containerView addSubview:toView];
    }
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        if (isPresent) {
            toView.frame = toFrame;
            fromView.frame = CGRectOffset(fromFrame, fromFrame.size.width*0.3*-1, 0);
        }
    } completion:^(BOOL finished) {
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        
        if (isCancelled)
            [toView removeFromSuperview];
        
        [transitionContext completeTransition:!isCancelled];
    }];   
}

@end
