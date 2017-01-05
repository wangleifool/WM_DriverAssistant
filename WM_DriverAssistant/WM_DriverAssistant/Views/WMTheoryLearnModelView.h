//
//  WMTheoryLearnModelView.h
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/11/22.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDButton.h"

@class WMTheoryLearnModelView;

@protocol WMTheoryLearnModelViewDelegate <NSObject>

- (void)touchUpActionOfTheoryLearnViewOutlet:(id)sender;

@end

@interface WMTheoryLearnModelView : UIView <HDButtonDelegate>
@property (weak, nonatomic) IBOutlet HDButton *btSubjectTech;
@property (weak, nonatomic) IBOutlet HDButton *btStudentWelfare;
@property (weak, nonatomic) IBOutlet HDButton *btAwardTryDrive;
@property (weak, nonatomic) IBOutlet HDButton *btIconRemember;
@property (weak, nonatomic) IBOutlet HDButton *btEarnCoin;
@property (weak, nonatomic) IBOutlet HDButton *btLearnLog;
@property (weak, nonatomic) IBOutlet HDButton *btFavoriteQuestions;
@property (weak, nonatomic) IBOutlet HDButton *btMistakeQuestions;

@property (weak, nonatomic) IBOutlet HDButton *btShuffleTraining;
@property (weak, nonatomic) IBOutlet HDButton *btSpecificTraning;
@property (weak, nonatomic) IBOutlet HDButton *btHardQuestions;
@property (weak, nonatomic) IBOutlet HDButton *btNoneLearnQuestions;
@property (weak, nonatomic) IBOutlet UIButton *btSortTraining;

@property (weak, nonatomic) IBOutlet HDButton *btBeforeTest;
@property (weak, nonatomic) IBOutlet HDButton *btLearnRate;
@property (weak, nonatomic) IBOutlet HDButton *btVipPass;
@property (weak, nonatomic) IBOutlet HDButton *btTestWeapon;
@property (weak, nonatomic) IBOutlet UIButton *btSimulationTest;

//@property (weak, nonatomic) IBOutlet UIButton *btSubjectTech;
//@property (weak, nonatomic) IBOutlet UIButton *btIconRemember;
//@property (weak, nonatomic) IBOutlet UIButton *btAwardTryDrive;
//@property (weak, nonatomic) IBOutlet UIButton *btStudentWelfare;

//@property (weak, nonatomic) IBOutlet UIButton *btShuffleTraining;
//@property (weak, nonatomic) IBOutlet UIButton *btSpecificTraning;
//@property (weak, nonatomic) IBOutlet UIButton *btHardQuestions;
//@property (weak, nonatomic) IBOutlet UIButton *btNoneLearnQuestions;
//@property (weak, nonatomic) IBOutlet UIButton *btSortTraining;

//@property (weak, nonatomic) IBOutlet UIButton *btBeforeTest;
//@property (weak, nonatomic) IBOutlet UIButton *btLearnRate;
//@property (weak, nonatomic) IBOutlet UIButton *btVipPass;
//@property (weak, nonatomic) IBOutlet UIButton *btTestDate;
//@property (weak, nonatomic) IBOutlet UIButton *btSimulationTest;

//@property (weak, nonatomic) IBOutlet UIButton *btMistakeQuestions;
//@property (weak, nonatomic) IBOutlet UIButton *btFavoriteQuestions;
//@property (weak, nonatomic) IBOutlet UIButton *btLearnLog;
//@property (weak, nonatomic) IBOutlet UIButton *btEarnCoin;
@property (strong,nonatomic) id <WMTheoryLearnModelViewDelegate> delegate;

@end
