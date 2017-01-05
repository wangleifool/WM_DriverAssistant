//
//  WMImgTextCollectionViewCell.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2017/1/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WMImgTextCollectionViewCell;

@protocol WMImgTextCollectionViewCellDelegate <NSObject>

- (void)cellDidClicked:(WMImgTextCollectionViewCell *)cell;

@end

@interface WMImgTextCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) id <WMImgTextCollectionViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *image;
@property (weak, nonatomic) IBOutlet UILabel *labelMainText;
@property (weak, nonatomic) IBOutlet UILabel *labelDesc;

@end
