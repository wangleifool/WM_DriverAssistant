//
//  WMBaiBaoXiangViewController.h
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMBasicNavViewController.h"
#import "WMBBXButtonViewCell.h"
#import "WM_SecondCollection.h"

@interface WMBaibaoxiangViewController : WMBasicNavViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSArray *btnTitles;
@property(nonatomic,strong)NSArray *btnTitles1;
@property(nonatomic,strong)NSArray *btnTitles2;
@property(nonatomic,strong)NSArray *btnImages;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIImageView *centerImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)WM_SecondCollection *secondCollectionView;
@property(nonatomic,strong)UIView *cutView;
@end
