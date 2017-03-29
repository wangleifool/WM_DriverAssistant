//
//  UIView+DMYExtension.m
//  Body
//
//  Created by mongyuan on 16/5/12.
//  Copyright © 2016年 mongyuan. All rights reserved.
//

#import "UIView+DMYExtension.h"

@implementation UIView (DMYExtension)

- (CGSize)dmy_size
{
    return self.frame.size;
}

- (void)setDmy_size:(CGSize)dmy_size
{
    CGRect frame = self.frame;
    frame.size = dmy_size;
    self.frame = frame;
}

- (CGFloat)dmy_width
{
    return self.frame.size.width;
}

- (CGFloat)dmy_height
{
    return self.frame.size.height;
}

- (void)setDmy_width:(CGFloat)dmy_width
{
    CGRect frame = self.frame;
    frame.size.width = dmy_width;
    self.frame = frame;
}

- (void)setDmy_height:(CGFloat)dmy_height
{
    CGRect frame = self.frame;
    frame.size.height = dmy_height;
    self.frame = frame;
}

- (CGFloat)dmy_x
{
    return self.frame.origin.x;
}

- (void)setDmy_x:(CGFloat)dmy_x
{
    CGRect frame = self.frame;
    frame.origin.x = dmy_x;
    self.frame = frame;
}

- (CGFloat)dmy_y
{
    return self.frame.origin.y;
}

- (void)setDmy_y:(CGFloat)dmy_y
{
    CGRect frame = self.frame;
    frame.origin.y = dmy_y;
    self.frame = frame;
}

- (CGFloat)dmy_centerX
{
    return self.center.x;
}

- (void)setDmy_centerX:(CGFloat)dmy_centerX
{
    CGPoint center = self.center;
    center.x = dmy_centerX;
    self.center = center;
}

- (CGFloat)dmy_centerY
{
    return self.center.y;
}

- (void)setDmy_centerY:(CGFloat)dmy_centerY
{
    CGPoint center = self.center;
    center.y = dmy_centerY;
    self.center = center;
}

- (CGFloat)dmy_right
{
    //    return self.xmg_x + self.xmg_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)dmy_bottom
{
    //    return self.xmg_y + self.xmg_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setDmy_right:(CGFloat)dmy_right
{
    self.dmy_x = dmy_right - self.dmy_width;
}

- (void)setDmy_bottom:(CGFloat)xmg_bottom
{
    self.dmy_y = xmg_bottom - self.dmy_height;
}

@end
