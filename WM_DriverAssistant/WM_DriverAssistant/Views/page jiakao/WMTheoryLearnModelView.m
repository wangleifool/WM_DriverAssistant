//
//  WMTheoryLearnModelView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/22.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMTheoryLearnModelView.h"

@interface WMTheoryLearnModelView ()



@end

@implementation WMTheoryLearnModelView

#pragma mark - 懒加载
//- (HDButton *)btSubjectTech
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _btSubjectTech.delegate = self;
//        [_btSubjectTech.iconImage setImage:[UIImage imageNamed:@"foot_icon_s"]]; 
//        [_btSubjectTech.titleLabel setText:@"科目技巧"];
//    });
//    
//    return _btSubjectTech;
//}

#pragma mark - 生命周期
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
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

- (void)layoutSubviews
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _btSubjectTech.delegate = self;
        [_btSubjectTech.iconImage setImage:[UIImage imageNamed:@"5"]];
        [_btSubjectTech.titleLabel setText:@"科目技巧"];
        
        
        _btIconRemember.delegate = self;
        [_btIconRemember.titleLabel setText:@"图标速记"];
        [_btIconRemember.iconImage setImage:[UIImage imageNamed:@"6"]];
        
        _btAwardTryDrive.delegate = self;
        [_btAwardTryDrive.titleLabel setText:@"有奖试驾"];
        [_btAwardTryDrive.iconImage setImage:[UIImage imageNamed:@"15"]];
        
        _btStudentWelfare.delegate = self;
        [_btStudentWelfare.titleLabel setText:@"学员福利"];
        [_btStudentWelfare.iconImage setImage:[UIImage imageNamed:@"14"]];
        
        _btEarnCoin.delegate = self;
        [_btEarnCoin.titleLabel setText:@"赚取金币"];
        [_btEarnCoin.iconImage setImage:[UIImage imageNamed:@"14"]];
        
        _btLearnLog.delegate = self;
        [_btLearnLog.titleLabel setText:@"学习日志"];
        [_btLearnLog.iconImage setImage:[UIImage imageNamed:@"7"]];
        
        _btFavoriteQuestions.delegate = self;
        [_btFavoriteQuestions.titleLabel setText:@"我的收藏"];
        [_btFavoriteQuestions.iconImage setImage:[UIImage imageNamed:@"13"]];
        
        _btMistakeQuestions.delegate = self;
        [_btMistakeQuestions.titleLabel setText:@"我的错题"];
        [_btMistakeQuestions.iconImage setImage:[UIImage imageNamed:@"12"]];
        
        _btShuffleTraining.delegate = self;
        [_btShuffleTraining.titleLabel setText:@"随机训练"];
        [_btShuffleTraining.iconImage setImage:[UIImage imageNamed:@"9"]];
        
        _btSpecificTraning.delegate = self;
        [_btSpecificTraning.titleLabel setText:@"专项训练"];
        [_btSpecificTraning.iconImage setImage:[UIImage imageNamed:@"8"]];
        
        _btHardQuestions.delegate = self;
        [_btHardQuestions.titleLabel setText:@"难题攻克"];
        [_btHardQuestions.iconImage setImage:[UIImage imageNamed:@"11"]];
        
        _btNoneLearnQuestions.delegate = self;
        [_btNoneLearnQuestions.titleLabel setText:@"未做题练习"];
        [_btNoneLearnQuestions.iconImage setImage:[UIImage imageNamed:@"10"]];
        
        _btBeforeTest.delegate = self;
        [_btBeforeTest.titleLabel setText:@"考前冲刺"];
        [_btBeforeTest.iconImage setImage:[UIImage imageNamed:@"15"]];
        
        _btLearnRate.delegate = self;
        [_btLearnRate.titleLabel setText:@"成绩排名"];
        [_btLearnRate.iconImage setImage:[UIImage imageNamed:@"8"]];
        
        _btVipPass.delegate = self;
        [_btVipPass.titleLabel setText:@"VIP保过"];
        [_btVipPass.iconImage setImage:[UIImage imageNamed:@"14"]];
        
        _btTestWeapon.delegate = self;
        [_btTestWeapon.titleLabel setText:@"报考神器"];
        [_btTestWeapon.iconImage setImage:[UIImage imageNamed:@"11"]];
        
                
    });
    
//    [self.btSubjectTech setImage:[UIImage imageNamed:@"icon_ditu_dingwei"] forState:UIControlStateNormal];
    
//    self.btSubjectTech.imageEdgeInsets = UIEdgeInsetsMake(- (self.btSubjectTech.frame.size.height - self.btSubjectTech.titleLabel.frame.size.height- self.btSubjectTech.titleLabel.frame.origin.y),(self.btSubjectTech.frame.size.width -self.btSubjectTech.titleLabel.frame.size.width)/2.0f -self.btSubjectTech.imageView.frame.size.width, 0, 0);
//    self.btSubjectTech.titleEdgeInsets = UIEdgeInsetsMake(self.btSubjectTech.frame.size.height-self.btSubjectTech.imageView.frame.size.height-self.btSubjectTech.imageView.frame.origin.y, - self.btSubjectTech.imageView.frame.size.width, 0, 0);
    
    self.btSortTraining.clipsToBounds = YES;
    self.btSortTraining.layer.cornerRadius = self.btSortTraining.bounds.size.width/2;
    
    self.btSimulationTest.clipsToBounds = YES;
    self.btSimulationTest.layer.cornerRadius = self.btSimulationTest.bounds.size.width/2;
}

#pragma mark - action of outlet

- (IBAction)actionTouchUpOfOutlet:(id)sender {
    [_delegate touchUpActionOfTheoryLearnViewOutlet:sender];
}

- (void)didTapHDButton:(HDButton *)sender
{
    [_delegate touchUpActionOfTheoryLearnViewOutlet:sender];
}

@end
