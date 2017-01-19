//
//  WM_SecondCollection.h
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WM_SecondCollection : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UICollectionView *collectionView;
@property(strong,nonatomic)NSArray *btnTitles2;

@end
