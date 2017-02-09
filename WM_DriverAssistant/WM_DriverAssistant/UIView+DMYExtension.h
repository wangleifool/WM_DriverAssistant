//
//  UIView+DMYExtension.h
//  Body
//
//  Created by mongyuan on 16/5/12.
//  Copyright © 2016年 mongyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DMYExtension)

@property (nonatomic, assign) CGSize dmy_size;//返回控件的大小
@property (nonatomic, assign) CGFloat dmy_width;//返回控件的宽度
@property (nonatomic, assign) CGFloat dmy_height;//返回控件的高度
@property (nonatomic, assign) CGFloat dmy_x;//返回控件的最小x
@property (nonatomic, assign) CGFloat dmy_y;//返回控件的最小y
@property (nonatomic, assign) CGFloat dmy_centerX;//返回控件的中心X
@property (nonatomic, assign) CGFloat dmy_centerY;//返回控件的中心Y

@property (nonatomic, assign) CGFloat dmy_right;//返回控件的最大X
@property (nonatomic, assign) CGFloat dmy_bottom;//返回控件在最大Y

@end
