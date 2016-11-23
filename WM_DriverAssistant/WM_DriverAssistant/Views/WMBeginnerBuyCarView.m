//
//  WMBeginnerBuyCarView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBeginnerBuyCarView.h"

@implementation WMBeginnerBuyCarView

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
    if (nil == self.viewBeginerCar.imageView.image) {
        [self.viewBeginerCar.labelMainText setText:@"新手好车"];
        [self.viewBeginerCar.labelDetailText setText:@"新手不容错过"];
    }
    
    if (nil == self.viewTryDrive.imageView.image) {
        [self.viewTryDrive.labelMainText setText:@"马上试驾"];
        [self.viewTryDrive.labelDetailText setText:@"买车之前试一下"];
    }
    
    if (nil == self.viewSUV.imageView.image) {
        [self.viewSUV.labelMainText setText:@"精选SUV"];
        [self.viewSUV.labelDetailText setText:@"最喜爱的SUV"];
    }
    
    if (nil == self.viewSecondHand.imageView.image) {
        [self.viewSecondHand.labelMainText setText:@"超值二手车"];
        [self.viewSecondHand.labelDetailText setText:@"十万就能买大奔"];
    }
}

@end
