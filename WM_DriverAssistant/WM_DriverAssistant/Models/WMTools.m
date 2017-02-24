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
    //获取字符串的尺寸，200是我们人为限定的宽度，高度动态计算，下面label的高度就用下面的高度
    NSDictionary *attribute =@{NSFontAttributeName: [UIFont systemFontOfSize:17]};
    CGSize labelSize = [text boundingRectWithSize:CGSizeMake(200,0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return labelSize;
}

@end
