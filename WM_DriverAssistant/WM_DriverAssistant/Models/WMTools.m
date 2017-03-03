//
//  WMTools.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMTools.h"

@implementation WMTools

+ (NSMutableArray *)getAnswerFromQuestionString:(NSString *)str
{
    NSMutableArray *result = [NSMutableArray array];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];    
    [result addObject:arr[0]]; //保存题干
    for(int i = 1;i < 5; i++)
    {
        [result addObject:[arr[i] substringFromIndex:2]];
    }
    
    return result;
}

+ (CGSize)getSizeWithLabelText:(NSString *)text
{
    return [self getSizeWithLabelText:text withFontSize:17.0];
}

+ (CGSize)getSizeWithLabelText:(NSString *)text withFontSize:(CGFloat)fontSize
{
    return [self getSizeWithLabelText:text withFontSize:fontSize withLabelWidth:200];
}

+ (CGSize)getSizeWithLabelText:(NSString *)text withFontSize:(CGFloat)fontSize withLabelWidth:(CGFloat)width
{
    //获取字符串的尺寸，200是我们人为限定的宽度，高度动态计算，下面label的高度就用下面的高度
    NSDictionary *attribute =@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize labelSize = [text boundingRectWithSize:CGSizeMake(width,0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return labelSize;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
