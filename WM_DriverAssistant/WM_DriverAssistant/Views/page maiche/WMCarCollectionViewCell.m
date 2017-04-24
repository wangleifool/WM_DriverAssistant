//
//  WMCarCollectionViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/20.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMCarCollectionViewCell.h"

@interface WMCarCollectionViewCell () <UIGestureRecognizerDelegate>

@end

@implementation WMCarCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UITapGestureRecognizer *tapGesReg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapGesAction:)];
//    tapGesReg.delegate = self;
    [self.carImageView addGestureRecognizer:tapGesReg];
    self.carImageView.userInteractionEnabled = YES;
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if ([touch.view isKindOfClass:[UIImageView class]]) {
//        [self.delegate cellImageTapped:(UIImageView *)touch.view];
//        return YES;
//    }
//    return NO;
//}

- (void)imageTapGesAction:(UIGestureRecognizer *)sender {

    
    if ([sender.view isKindOfClass:[UIImageView class]]) {
        [self.delegate cellImageTapped:sender.view];
    }
}

@end
