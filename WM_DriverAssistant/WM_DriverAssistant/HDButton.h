//
//  HDButton.h
//  map
//
//  Created by 智富360 on 16/1/6.
//  Copyright © 2016年 智富360. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDButton;

@protocol HDButtonDelegate <NSObject>

- (void)didTapHDButton:(HDButton *)sender;

@end

@interface HDButton : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, assign)id<HDButtonDelegate> delegate;
@end
