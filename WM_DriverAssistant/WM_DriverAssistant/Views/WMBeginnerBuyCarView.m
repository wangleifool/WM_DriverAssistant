//
//  WMBeginnerBuyCarView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMBeginnerBuyCarView.h"
#import "WMImgTextCollectionViewCell.h"

@interface WMBeginnerBuyCarView () <WMImgTextCollectionViewCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionViewLayout *collectionLayout;
}

@property (strong,nonatomic) NSArray *collectViewData;

@end

@implementation WMBeginnerBuyCarView

static NSString* cellID = @"collectViewCell";

- (NSArray *)collectViewData
{
    if (nil == _collectViewData) {
        _collectViewData = @[@{@"imgName":@"xx1",@"mainText":@"练手好车",@"subText":@"新手不容错过"},
                             @{@"imgName":@"xx2",@"mainText":@"马上试驾",@"subText":@"买车之前试一下"},
                             @{@"imgName":@"xx3",@"mainText":@"精选SUV",@"subText":@"最喜最爱的SUV"},
                             @{@"imgName":@"xx4",@"mainText":@"超值二手车",@"subText":@"十万就能买大奔"}];
    }
    
    return _collectViewData;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIView * contentView = nil;
        if (IsiPad) {
            contentView = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner:self options:nil] firstObject];
        } else {
            contentView = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner:self options:nil] lastObject];
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview: contentView];
        
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeLeft multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeRight multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeTop multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];
        
//        collectionLayout = [[UICollectionViewLayout alloc] init];
//        collectionLayout.
        
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerNib:[UINib nibWithNibName:@"WMImgTextCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
        
        self.collectionViewFlowLayout.itemSize = CGSizeMake(self.frame.size.width/2 - 6, self.collectionView.frame.size.height/(self.collectViewData.count / 2));
        self.collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    
    return self;
}


- (void)layoutSubviews
{
//    if (nil == self.viewBeginerCar.imageView.image) {
//        [self.viewBeginerCar.labelMainText setText:@"新手好车"];
//        [self.viewBeginerCar.labelDetailText setText:@"新手不容错过"];
//    }
//    
//    if (nil == self.viewTryDrive.imageView.image) {
//        [self.viewTryDrive.labelMainText setText:@"马上试驾"];
//        [self.viewTryDrive.labelDetailText setText:@"买车之前试一下"];
//    }
//    
//    if (nil == self.viewSUV.imageView.image) {
//        [self.viewSUV.labelMainText setText:@"精选SUV"];
//        [self.viewSUV.labelDetailText setText:@"最喜爱的SUV"];
//    }
//    
//    if (nil == self.viewSecondHand.imageView.image) {
//        [self.viewSecondHand.labelMainText setText:@"超值二手车"];
//        [self.viewSecondHand.labelDetailText setText:@"十万就能买大奔"];
//    }
}

#pragma mark - collectionView data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectViewData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WMImgTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    [cell.image setImage:[UIImage imageNamed:[self.collectViewData[indexPath.row] objectForKey:@"imgName"]] forState:UIControlStateNormal];
    [cell.labelMainText setText:[self.collectViewData[indexPath.row] objectForKey:@"mainText"]];
    [cell.labelDesc setText:[self.collectViewData[indexPath.row] objectForKey:@"subText"]];

    cell.delegate = self;
    
    return cell;
}

- (void)cellDidClicked:(WMImgTextCollectionViewCell *)cell
{
    NSLog(@"cell pushed %@",cell.description);
}

@end
