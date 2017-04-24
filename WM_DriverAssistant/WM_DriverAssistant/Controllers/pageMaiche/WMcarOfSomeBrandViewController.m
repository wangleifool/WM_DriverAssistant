//
//  WMcarOfSomeBrandViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/20.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMcarOfSomeBrandViewController.h"
#import "WMCarCollectionViewCell.h"
#import "URBMediaFocusViewController.h"

@interface WMcarOfSomeBrandViewController () <UICollectionViewDelegate,UICollectionViewDataSource,WMCarCollectionViewCellDelegate,URBMediaFocusViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (strong, nonatomic) URBMediaFocusViewController *mediaFocusViewController;

@end

@implementation WMcarOfSomeBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self.mainCollectionView registerClass:[WMCarCollectionViewCell class] forCellWithReuseIdentifier:@"WMCarCollectionViewCell"];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"WMCarCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"WMCarCollectionViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WMCarCollectionViewCell *cell = (WMCarCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WMCarCollectionViewCell" forIndexPath:indexPath];
    [self configureCell:cell withIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

- (void)configureCell:(WMCarCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
//    UIView  *subview = [cell.contentView viewWithTag:TAG];
//    [subview removeFromSuperview];
    
    
    
    switch (indexPath.section) {
        case 0:
            cell.carImageView.image =  [UIImage imageNamed:@"Audi_1_1"];
            cell.carNameLabel.text = @"Audi A1";
            break;
        case 1:
            cell.carImageView.image =  [UIImage imageNamed:@"Audi_2_1"];
            cell.carNameLabel.text = @"Audi A2";
            break;
        case 2:
            cell.carImageView.image =  [UIImage imageNamed:@"Audi_3_1"];
            cell.carNameLabel.text = @"Audi A3";
            break;
        case 3:
            cell.carImageView.image =  [UIImage imageNamed:@"Audi_4_1"];
            cell.carNameLabel.text = @"Audi A4";
            break;
        case 4:
            cell.carImageView.image =  [UIImage imageNamed:@"Audi_5_1"];
            cell.carNameLabel.text = @"Audi A5";
            break;
        default:
            break;
    }
}

- (void)cellImageTapped:(UIImageView *)imageView
{
    URBMediaFocusViewController *controller = [[URBMediaFocusViewController alloc] init];
    [controller showImage:imageView.image fromView:self.mainCollectionView inViewController:self];
    controller.delegate = self;
    self.mediaFocusViewController = controller;
}

#pragma mark URBMediaFocusViewControllerDelegate

- (void)mediaFocusViewControllerDidDisappear:(URBMediaFocusViewController *)mediaFocusViewController {
    self.mediaFocusViewController = nil;
}

@end
