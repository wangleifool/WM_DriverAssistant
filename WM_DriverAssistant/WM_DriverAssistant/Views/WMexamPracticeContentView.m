//
//  WMexamPracticeContentView.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/10.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMexamPracticeContentView.h"
#import "WMAutoBreakLineLabel.h"
#import "UIView+DMYExtension.h"
#import "WMexamAnswerCellTableViewCell.h"
#import "WMmodelOfExamQuestion.h"

#define SelfSize self.frame.size

@interface WMexamPracticeContentView () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_leftTableView;
    UITableView *_centerTableView;
    UITableView *_rightTableView;
    
    NSArray *_allQuestionsModel;
    
    UIView  *centerViewOfFooter;
}

@property(nonatomic,assign)CGPoint   start;

@property(nonatomic,assign) BOOL isLeftViewShadow;
@property(nonatomic,assign) BOOL isCenterViewShadow;

@end

@implementation WMexamPracticeContentView

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)allQuestionArray
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.currentQuestionIndex = 0;
        _allQuestionsModel = allQuestionArray;
        
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(-SelfSize.width, 0, SelfSize.width, SelfSize.height) style:UITableViewStyleGrouped];
        _centerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SelfSize.width, SelfSize.height) style:UITableViewStyleGrouped];
        _rightTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SelfSize.width, SelfSize.height) style:UITableViewStyleGrouped];
        
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _centerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        _centerTableView.delegate = self;
        _centerTableView.dataSource = self;
        _rightTableView.delegate =self;
        _rightTableView.dataSource = self;
        
        [self addSubview:_leftTableView];
        [self addSubview:_centerTableView];
        [self addSubview:_rightTableView];
        
        [self sendSubviewToBack:_rightTableView];
        [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveView:)]];
        
        
    }
    
    return self;
}


-(void)moveView:(UIPanGestureRecognizer *)pan{
    
    
    CGPoint point = [pan locationInView:self];
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.start = point;
        }
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat lenth = point.x - self.start.x;
            NSLog(@"changing :%f",lenth);
            if (lenth > 0) {
                if (self.currentQuestionIndex == 0) {
                    return;
                }
                if (!self.isLeftViewShadow) {
                    _centerTableView.dmy_x = 0;
                    [self addLeftViewShadowEffect];
                    [self removeCenterViewShadowEffect];
                }
                _leftTableView.dmy_x = - SelfSize.width + lenth;
            }else{
                if (!self.isCenterViewShadow) {
                    _leftTableView.dmy_x = -SelfSize.width;
                    [self addCenterViewShadowEffect];
                    [self removeLeftViewShadowEffect];
                }
                _centerTableView.dmy_x = lenth;
            }
        }
            
            break;
        case UIGestureRecognizerStateEnded:{
            CGFloat lenth = point.x - self.start.x;
            if (lenth > 0 ) { //右滑
                if (self.currentQuestionIndex == 0) {
                    return;
                }
                if (lenth > SelfSize.width/3) {
                    [UIView animateWithDuration:0.3 animations:^{
                        _leftTableView.dmy_x = 0;
                    } completion:^(BOOL finished) {
                        self.currentQuestionIndex -= 1;
                        
                        [self removeLeftViewShadowEffect];
                        
                        //左边视图和中间视图互换
                        UITableView * view = _leftTableView;
                        _leftTableView = _rightTableView;
                        _leftTableView.dmy_x = -SelfSize.width;
                        _rightTableView = _centerTableView;
                        _centerTableView = view;
                        
                        [self sendSubviewToBack:_rightTableView];
                        [self bringSubviewToFront:_leftTableView];
                        
                        [self reloadData];
                    }];
                }else{
                    [UIView animateWithDuration:0.3 animations:^{
                        _leftTableView.dmy_x = -SelfSize.width;
                    } completion:^(BOOL finished) {
                        [self removeLeftViewShadowEffect];
                    }];
                }
            }else{ //左滑
                lenth = -lenth;
                if (self.currentQuestionIndex == _allQuestionsModel.count-1) {
                    return;
                }
                
                if (lenth > SelfSize.width/3) {
                    [UIView animateWithDuration:0.3 animations:^{
                        _centerTableView.dmy_x = -SelfSize.width;
                    } completion:^(BOOL finished) {
                        self.currentQuestionIndex += 1;
                        
                        [self removeCenterViewShadowEffect];
                        
                        //三个视图互换位置
                        UITableView * view = _rightTableView;
                        _rightTableView = _leftTableView;
                        _leftTableView = _centerTableView;
                        _centerTableView = view;
                        
                        //微调
                        [self sendSubviewToBack:_rightTableView];
                        _rightTableView.dmy_x = 0;
                        
                        [self reloadData];
                    }];
                }else{
                    [UIView animateWithDuration:0.3 animations:^{
                        _centerTableView.dmy_x = 0;
                    } completion:^(BOOL finished) {
                        [self removeCenterViewShadowEffect];
                    }];
                }
            }
            
        }
            break;
        default:
            break;
    }
}

- (void)addLeftViewShadowEffect
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_leftTableView.bounds];
    _leftTableView.layer.masksToBounds = NO;
    _leftTableView.layer.shadowColor = [UIColor blackColor].CGColor;
    _leftTableView.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    _leftTableView.layer.shadowOpacity = 0.5f;
    _leftTableView.layer.shadowPath = shadowPath.CGPath;
    
    self.isLeftViewShadow = YES;
}

- (void)addCenterViewShadowEffect
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_centerTableView.bounds];
    _centerTableView.layer.masksToBounds = NO;
    _centerTableView.layer.shadowColor = [UIColor blackColor].CGColor;
    _centerTableView.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    _centerTableView.layer.shadowOpacity = 0.5f;
    _centerTableView.layer.shadowPath = shadowPath.CGPath;
    
    self.isCenterViewShadow = YES;
}

- (void)removeLeftViewShadowEffect
{
    _leftTableView.layer.masksToBounds = YES;
    self.isLeftViewShadow = NO;
}

- (void)removeCenterViewShadowEffect
{
    _centerTableView.layer.masksToBounds = YES;
    self.isCenterViewShadow = NO;
}

#pragma mark - tableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
    return model.mChoiceOfAnswer.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
    NSString *text = [model.mChoiceOfAnswer objectAtIndex:indexPath.row];
    return [WMTools getSizeWithLabelText:text].height + 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMexamAnswerCellTableViewCell *cell = [WMexamAnswerCellTableViewCell answerCellWithTableView:tableView];
    WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
    
    NSArray *arrayIndex = @[@"A",@"B",@"C",@"D"];
    [cell updateLabelAnswerIndexText:arrayIndex[indexPath.row]];
    [cell.labelAnswerContent setText:model.mChoiceOfAnswer[indexPath.row]];
    
    
    if (model.mUserSelectAnswer) { //如果用户做出了回答，需要显示结果
        
        if (model.mType == IsChoiceQuestion ) {
            
            if ([arrayIndex indexOfObject:model.mAnswer] == indexPath.row) {
                cell.isRightAnswer = YES;
            }
            
            if (![model.mUserSelectAnswer isEqualToString:model.mAnswer] && [arrayIndex indexOfObject:model.mUserSelectAnswer] == indexPath.row) {
                cell.isRightAnswer = NO;
            }
            
        } else {
            if ([model.mChoiceOfAnswer indexOfObject:model.mAnswer] == indexPath.row)
                cell.isRightAnswer = YES;
            
            if (![model.mUserSelectAnswer isEqualToString:model.mAnswer] && [model.mChoiceOfAnswer indexOfObject:model.mUserSelectAnswer] == indexPath.row) {
                cell.isRightAnswer = NO;
            }
        }
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //答题section
    if (0 == section) {
        WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
        NSString *text = [NSString stringWithFormat:@"%ld: %@",model.mID,model.mQuestion];
        CGFloat height = [WMTools getSizeWithLabelText:text withFontSize:17.0 withLabelWidth:tableView.frame.size.width-20].height;
        if (model.mImage && ![model.mImage isEqualToString:@""]) {
            return height+10+100; //100 imageview高度
        }
        return height+10;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //答题section
    if (0 == section) {
        WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
        UIView *view = [[UIView alloc] init];
//        [view setBackgroundColor:[UIColor redColor]];
        
        NSString *text = [NSString stringWithFormat:@"%ld: %@",model.mID,model.mQuestion];
        CGFloat height = [WMTools getSizeWithLabelText:text withFontSize:17.0 withLabelWidth:tableView.frame.size.width-20].height;
        
        CGRect frameOfLabel = CGRectMake(10, 5, tableView.frame.size.width - 20, height);
        UILabel *labelQuestion = [[UILabel alloc] initWithFrame:frameOfLabel];
        labelQuestion.font = [UIFont systemFontOfSize:17.0];
        labelQuestion.numberOfLines = 0;
        
        [labelQuestion setText:text];
//        [labelQuestion setBackgroundColor:[UIColor greenColor]];
        [view addSubview:labelQuestion];
        
        
        CGRect frameOfImage = CGRectMake((tableView.frame.size.width - 100)/2, frameOfLabel.size.height + frameOfLabel.origin.y, 100, 0);
        if (model.mImage && ![model.mImage isEqualToString:@""]) {
            frameOfImage.size.height = 100;
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:frameOfImage];
            [imgView setImage:[UIImage imageNamed:[model.mImage stringByDeletingPathExtension]]];
            [view addSubview:imgView];
        }
        
        
        CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, height+10+frameOfImage.size.height);
        [view setFrame:frame];
        return view;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (0 == section) {
        WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
        return [WMTools getSizeWithLabelText:model.mDesc].height + 15;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (0 == section) {
        WMmodelOfExamQuestion *model = [self getRightModelWithTableView:tableView];
        UIView *view = [[UIView alloc] init];
        [view setBackgroundColor:[UIColor whiteColor]];
        
        CGRect frameLine = CGRectMake(0, 0, tableView.frame.size.width, 0);
        NSString *strLine = @"_____________________试题解析_____________________";
        CGSize strLineSize = [WMTools getSizeWithLabelText:strLine withFontSize:14.0 withLabelWidth:frameLine.size.width];
        frameLine.size.height = strLineSize.height;
        UILabel *labelLine = [[UILabel alloc] initWithFrame:frameLine];
        labelLine.font = [UIFont systemFontOfSize:14.0];
//        [labelLine setBackgroundColor:[UIColor redColor]];
        [labelLine setText:strLine];
        [labelLine setTextColor:[UIColor lightGrayColor]];
        labelLine.textAlignment = NSTextAlignmentCenter;
        [view addSubview:labelLine];
        
        CGRect frameOfDesc = CGRectMake(10, strLineSize.height+5, tableView.frame.size.width - 20, 0);
        CGFloat descStrHeight = [WMTools getSizeWithLabelText:model.mDesc withFontSize:17.0 withLabelWidth:frameOfDesc.size.width].height;
        frameOfDesc.size.height = descStrHeight;
        UILabel *labelDesc = [[UILabel alloc] initWithFrame:frameOfDesc];
        labelDesc.font = [UIFont systemFontOfSize:17.0];
//        [labelDesc setBackgroundColor:[UIColor greenColor]];
        labelDesc.numberOfLines = 0;
        NSString *text = [NSString stringWithFormat:@"%@",model.mDesc];
        [labelDesc setText:text];
        [view addSubview:labelDesc];
        
//        view.hidden = YES;
        CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, descStrHeight+strLineSize.height+5);
        [view setFrame:frame];
        view.hidden = YES;
        
        if (model.mUserSelectAnswer) { //如果用户做出了回答，需要显示结果
            if (![model.mUserSelectAnswer isEqualToString:model.mAnswer]) {
                view.hidden = NO;
            }
        }
        
        return view;
    }
    
    return nil;
}

- (WMmodelOfExamQuestion *)getRightModelWithTableView:(UITableView *)tableView
{
    WMmodelOfExamQuestion *model = nil;
    if (tableView == _leftTableView && self.currentQuestionIndex != 0) {
        model = [_allQuestionsModel objectAtIndex:self.currentQuestionIndex-1];
    } else if (tableView == _centerTableView) {
        model = [_allQuestionsModel objectAtIndex:self.currentQuestionIndex];
    } else if (tableView == _rightTableView && self.currentQuestionIndex < _allQuestionsModel.count-1) { //最后一页
        model = [_allQuestionsModel objectAtIndex:self.currentQuestionIndex + 1];
    }
    
    return model;
}

- (void)reloadData
{
    [_leftTableView reloadData];
//    [_centerTableView reloadData];
    [_rightTableView reloadData];
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WMmodelOfExamQuestion *model = [_allQuestionsModel objectAtIndex:self.currentQuestionIndex];
    
    if (nil == model.mUserSelectAnswer) {
        if (model.mType == IsChoiceQuestion) {
            NSArray *choices = @[@"A",@"B",@"C",@"D"];
            model.mUserSelectAnswer = choices[indexPath.row];
        } else {
            model.mUserSelectAnswer = [model.mChoiceOfAnswer objectAtIndex:indexPath.row];
        }
        
        [_centerTableView reloadData];
    }
    
}
@end
