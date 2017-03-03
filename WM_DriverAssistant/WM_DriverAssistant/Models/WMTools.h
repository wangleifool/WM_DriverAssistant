//
//  WMTools.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WMTools : NSObject

+ (NSMutableArray *)getAnswerFromQuestionString:(NSString *)str;

+ (CGSize)getSizeWithLabelText:(NSString *)text;
+ (CGSize)getSizeWithLabelText:(NSString *)text withFontSize:(CGFloat)fontSize;
+ (CGSize)getSizeWithLabelText:(NSString *)text withFontSize:(CGFloat)fontSize withLabelWidth:(CGFloat)width;
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
@end
