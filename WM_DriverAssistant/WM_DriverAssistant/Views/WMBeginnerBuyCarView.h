//
//  WMBeginnerBuyCarView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMImageAndTwoLineTextView.h"

@interface WMBeginnerBuyCarView : UIView
@property (weak, nonatomic) IBOutlet WMImageAndTwoLineTextView *viewBeginerCar;
@property (weak, nonatomic) IBOutlet WMImageAndTwoLineTextView *viewSUV;
@property (weak, nonatomic) IBOutlet WMImageAndTwoLineTextView *viewTryDrive;
@property (weak, nonatomic) IBOutlet WMImageAndTwoLineTextView *viewSecondHand;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@end
