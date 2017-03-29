//
//  WMScrollView.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/3/9.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMScrollView.h"

@implementation WMScrollView

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer.view isKindOfClass:[UIScrollView class]]) {
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x==0) {
            return YES;
        }
        
    }
    return NO;
}
-(BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer
{
    int location_X = 100;
    if (gestureRecognizer == self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            if (point.x > 0 && location.x < location_X && self.contentOffset.x <= 0) {
                return YES;
            }
        }
    }
    return NO;
}
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if ([self panBack:gestureRecognizer]) {
//        return NO;
//    }
//    return YES;
//}
@end
