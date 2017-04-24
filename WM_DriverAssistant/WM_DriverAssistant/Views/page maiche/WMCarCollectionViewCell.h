//
//  WMCarCollectionViewCell.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/20.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMCarCollectionViewCell;

@protocol WMCarCollectionViewCellDelegate <NSObject>

- (void)cellImageTapped:(UIImageView *)imageView;

@end

@interface WMCarCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *carNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *carTypeLabel;

@property (strong, nonatomic) id <WMCarCollectionViewCellDelegate> delegate;
@end
