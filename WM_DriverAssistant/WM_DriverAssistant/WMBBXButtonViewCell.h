//
//  WMBBXButtonViewCell.h
//  WM_DriverAssistant
//
//  Created by 梅毅 on 16/11/9.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WMBBXButtonDelegate <NSObject>

-(void)cellButtonDidClicked:(UIButton *)button;

@end

@interface WMBBXButtonViewCell : UITableViewCell

@property(nonatomic,strong)NSArray *btnTitles;
@property(nonatomic,strong)NSArray *btnImages;
@property(nonatomic,strong)id<WMBBXButtonDelegate>delegate;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
