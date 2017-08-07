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

+ (void)GetHttpData:(NSString *)url success:(void (^)(id response))suc failed:(void (^)(NSError* error))faield;

/**
 *  用颜色返回一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor*) color;
@end
