//
//  HDButton.m
//  map
//
//  Created by 智富360 on 16/1/6.
//  Copyright © 2016年 智富360. All rights reserved.
//

#import "HDButton.h"

@implementation HDButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self loadContentView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadContentView];
    }
    return self;
}

- (void)loadContentView {
    
    UIView *contentView = [[NSBundle mainBundle] loadNibNamed:@"HDButton" owner:self options:nil].firstObject;
    if (contentView) {
        [self addSubview:contentView];
        contentView.translatesAutoresizingMaskIntoConstraints = YES;
        contentView.frame = self.bounds;
        
    }
    self.backgroundColor = [UIColor whiteColor];
    
}
- (IBAction)tapButton:(id)sender {
    
    if (self.delegate != nil) {
        [self.delegate didTapHDButton:self];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
