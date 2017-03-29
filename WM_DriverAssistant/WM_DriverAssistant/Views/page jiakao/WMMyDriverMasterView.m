//
//  WMMyDriverMasterView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/7.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMMyDriverMasterView.h"

@interface WMMyDriverMasterView()
{
    
}

@end

@implementation WMMyDriverMasterView

#pragma mark - 初始化
- (void)awakeFromNib
{
    self.labelTitle.adjustsFontSizeToFitWidth = YES;
    self.labelTitle.minimumScaleFactor = 0.6;
    self.labelDescription.adjustsFontSizeToFitWidth = YES;
    self.labelDescription.minimumScaleFactor = 0.6;
}

- (void)layoutSubviews
{
    //添加点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    [self addGestureRecognizer:tapGesture];
    
//    //设置头像显示圆形  这里如果约束是用的长宽比例1:1 下面的设置导致图片无效
//    self.imageViewSulpture.clipsToBounds = YES;
//    self.imageViewSulpture.layer.cornerRadius = self.imageViewSulpture.bounds.size.width/2;
    
    if (_isBindingDriverMaster) {
        [self.labelTitle setText:TEXT_TITLE_BINDING_OK];
        [self.labelDescription setText:TEXT_DESC_BINDING_OK];
        
        //从教练数据模型中，获取教练头像
    } else {
        [self.labelTitle setText:TEXT_TITLE_BINDING_NOTOK];
        [self.labelDescription setText:TEXT_DESC_BINDING_NOTOK];
        [self.imageViewSulpture setImage:[UIImage imageNamed:@"icon_xc_jiaolian"]];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (nil != self) {
        UIView * contentView = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner:self options:nil] firstObject];
        
        contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview: contentView];
        
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeLeft multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeRight multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeTop multiplier: 1.0 constant: 0]];
        [self addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: self attribute:NSLayoutAttributeBottom multiplier: 1.0 constant: 0]];
    }
    
    return self;
}


#pragma mark - lazy load
- (void)setModelOfDriverMaster:(id)modelOfDriverMaster
{
    if (modelOfDriverMaster != nil) {
        _isBindingDriverMaster = YES;
        _modelOfDriverMaster = modelOfDriverMaster;
    }
}

#pragma mark - 本视图点击手势
- (void)tapGestureAction:(id)sender
{
    [_delegate actionOfTapMyDriverMasterView:self];
}

@end
