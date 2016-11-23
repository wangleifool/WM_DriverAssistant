//
//  WMCircleOfFriendsPreview.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMCircleOfFriendsPreview.h"

@implementation WMCircleOfFriendsPreview

#pragma mark - 生命周期
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIView * contentView = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner:self options:nil] firstObject];
        
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview: contentView];
        
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeLeft multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeRight multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeTop multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];
    }
    
    return self;
}


- (void)layoutSubviews
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //添加点击手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self.viewOfTopicFriends addGestureRecognizer:tapGesture];
    });
    
    for (UIImageView *imageView in self.iconOfFriendsImageViews) {
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = imageView.bounds.size.width/2;
    }    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - action of outlet
- (void)tapGestureAction:(id)sender
{
    NSLog(@"tap gesture of circle frients");
}

- (IBAction)btTopicConversationPressed:(id)sender {
    
}
@end
