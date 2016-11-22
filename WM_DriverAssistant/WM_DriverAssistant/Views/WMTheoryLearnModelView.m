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

//- (IBAction)btSubjectTechPressed:(id)sender {
//    [_delegate actionOfOutlet:sender];
//}
//
//- (IBAction)btIconRememberPressed:(id)sender {
//    
//}
//- (IBAction)btAwardTryDrivePressed:(id)sender {
//}
//- (IBAction)btStudentWlfarePressed:(id)sender {
//}
//- (IBAction)btShuffleTraningPressed:(id)sender {
//}
//- (IBAction)btSpecificTraining:(id)sender {
//}
//- (IBAction)btHardQuestionsPressed:(id)sender {
//}
//
//- (IBAction)btNoneLearnQuestionsPressed:(id)sender {
//}
//- (IBAction)btSortTrainingPressed:(id)sender {
//}
//- (IBAction)btBeforeTestPressed:(id)sender {
//}
//- (IBAction)btLearnRatePressed:(id)sender {
//}
//- (IBAction)btVipPassPressed:(id)sender {
//}
//- (IBAction)btTestDatePressed:(id)sender {
//}
//
//- (IBAction)btSimulationTestPressed:(id)sender {
//}

//- (IBAction)btMistakeQuestionsPressed:(id)sender {
//}
//
//- (IBAction)btFavoriteQuestionsPressed:(id)sender {
//}
//
//- (IBAction)btLearnLogPressed:(id)sender {
//}
//
//- (IBAction)btEarnCoinPressed:(id)sender {
//}


@end
