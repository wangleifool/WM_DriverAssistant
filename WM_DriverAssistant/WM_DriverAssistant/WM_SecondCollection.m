//
//  WM_SecondCollection.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2016/11/23.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WM_SecondCollection.h"
#import "WM_CollectionViewCell.h"

@implementation WM_SecondCollection

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _btnTitles2 = @[@"测星座福地",@"砸金蛋",@"解锁星座",@"手机借款",@"办理信用卡",@"车险资讯",@"汽车头条",@"免费测保费",@"二手车",@"聊聊学车",@"帮选车",@"更多"];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置cell的大小
        layout.itemSize = CGSizeMake(768/4, 180);
        self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[WM_CollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
    }
    
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _btnTitles2.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WM_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLab.text = [_btnTitles2 objectAtIndex:indexPath.row];
    cell.titleLab.textColor = [UIColor redColor];
    //cell.backgroundColor = [UIColor blueColor];
    return cell;
}
@end
