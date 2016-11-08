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
    CGRect myFrame;
}

@end

@implementation WMMyDriverMasterView

#pragma mark - 初始化
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

- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WMMyDriverMasterView" owner:nil options:nil] firstObject];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WMMyDriverMasterView" owner:nil options:nil] firstObject];
        myFrame = frame;
    }
    return self;
}

- (void)setMyFrame:(CGRect)frame
{
    myFrame = frame;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.frame = myFrame;
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
