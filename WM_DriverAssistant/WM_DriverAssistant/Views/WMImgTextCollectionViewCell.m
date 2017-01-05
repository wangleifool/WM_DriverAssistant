//
//  WMImgTextCollectionViewCell.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2017/1/5.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMImgTextCollectionViewCell.h"

@implementation WMImgTextCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)btClicked:(id)sender {
    [_delegate cellDidClicked:self];
}
@end
