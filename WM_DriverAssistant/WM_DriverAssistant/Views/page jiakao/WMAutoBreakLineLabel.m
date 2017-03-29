//
//  WMAutoBreakLineLabel.m
//  jiakaoQuestionView
//
//  Created by lei wang on 2017/2/9.
//  Copyright © 2017年 lei wang. All rights reserved.
//

#import "WMAutoBreakLineLabel.h"

@implementation WMAutoBreakLineLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setText:(NSString *)text
{
    //获取字符串的尺寸，200是我们人为限定的宽度，高度动态计算，下面label的高度就用下面的高度
    NSDictionary *attribute =@{NSFontAttributeName: [UIFont systemFontOfSize:17]};
    CGSize labelSize = [text boundingRectWithSize:CGSizeMake(self.frame.size.width,0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    self.numberOfLines = 0;
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height)];
    
    [super setText:text];
}

@end
