//
//  WMexamPracticeToolBarView.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMexamPracticeToolBarView.h"
#import "WMHeaderCollectionReusableView.h"
#import "WMquestionIndexCollectionViewCell.h"

@interface WMexamPracticeToolBarView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIButton *backgroundButton;
    UIProgressView *progressOfWholeQuestion;
    UICollectionView *allQuestionIndexCollectionView;
    
    //
    CGPoint startPanPoint;
    CGPoint previousPanPoint;
    CGRect  frameBeforePan;
}

@end


@implementation WMexamPracticeToolBarView

#pragma mark - lazy load
- (void)setCurrentQuestionIndex:(NSInteger)currentQuestionIndex
{
    _currentQuestionIndex = currentQuestionIndex;
    [self.labelCurQuestionIndex setText:[NSString stringWithFormat:@"%ld/%ld",_currentQuestionIndex+1,self.totalQuestionNum]];
    [allQuestionIndexCollectionView reloadData];
}

- (void)setNumOfWrongAnswer:(NSInteger)numOfWrongAnswer
{
    _numOfWrongAnswer = numOfWrongAnswer;
    [self.btNumOfErrorQuestion setTitle:[NSString stringWithFormat:@"%ld",_numOfWrongAnswer] forState:UIControlStateNormal];
    
    progressOfWholeQuestion.progress = (_numOfWrongAnswer + self.numOfCorrectAnswer)/(float)self.totalQuestionNum;
}

- (void)setNumOfCorrectAnswer:(NSInteger)numOfCorrectAnswer
{
    _numOfCorrectAnswer = numOfCorrectAnswer;
    [self.btNumOfRightQuestion setTitle:[NSString stringWithFormat:@"%ld",_numOfCorrectAnswer] forState:UIControlStateNormal];
    progressOfWholeQuestion.progress = (self.numOfWrongAnswer + _numOfCorrectAnswer)/(float)self.totalQuestionNum;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    
    if (nil == backgroundButton) {
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR);
        backgroundButton = [[UIButton alloc] initWithFrame:frame];
        [backgroundButton addTarget:self action:@selector(touchUpInsideOfBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加拖动手势
        UIPanGestureRecognizer *panGestureRecog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveToolBar:)];
        [backgroundButton addGestureRecognizer:panGestureRecog];
        
        [self addSubview:backgroundButton];
    }
    
    if (nil == progressOfWholeQuestion) {
        CGRect frameOfProgress = self.frame;
        frameOfProgress.size.height = 2;
        frameOfProgress.origin.y = 0;
        progressOfWholeQuestion = [[UIProgressView alloc] initWithFrame:frameOfProgress];
        [progressOfWholeQuestion setTintColor:[UIColor blueColor]];
        progressOfWholeQuestion.progress = 0;
        
        [self addSubview:progressOfWholeQuestion];
    }
    
    if (nil == self.btCollect) {
        CGRect frameOfBt;
        frameOfBt.origin.x = DISTANCE_PER_CONTROL-10;
        frameOfBt.size.width = WIDTH_OF_CONTROL+10;
        frameOfBt.size.height = 32;
        frameOfBt.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfBt.size.height/2; //由center决定控件的y坐标
        
        self.btCollect = [[UIButton alloc] initWithFrame:frameOfBt];
        [self.btCollect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btCollect.titleLabel.font = [UIFont systemFontOfSize:13.0];
        self.btCollect.tag = 0; // 0 未收藏 1已经收藏
        if (0 == self.btCollect.tag)
        {
            [self.btCollect setImage:[UIImage imageNamed:@"starEmpty"] forState:UIControlStateNormal];
            [self.btCollect setTitle:@"   收藏" forState:UIControlStateNormal];
        }
        [self.btCollect addTarget:self action:@selector(touchUpInsideOfCollect:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.btCollect];
    }
    
    if (nil == self.btNumOfErrorQuestion) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.btCollect.frame.origin.x + self.btCollect.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.btNumOfErrorQuestion = [[UIButton alloc] initWithFrame:frameOfLabel];
        [self.btNumOfErrorQuestion setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btNumOfErrorQuestion setImage:[UIImage imageNamed:@"wrongIndex"] forState:UIControlStateNormal];
        self.btNumOfErrorQuestion.userInteractionEnabled = NO;
        
        [self addSubview:self.btNumOfErrorQuestion];
    }
    
    if (nil == self.btNumOfRightQuestion) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.btNumOfErrorQuestion.frame.origin.x + self.btNumOfErrorQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.btNumOfRightQuestion = [[UIButton alloc] initWithFrame:frameOfLabel];
        [self.btNumOfRightQuestion setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btNumOfRightQuestion setImage:[UIImage imageNamed:@"correctIndex"] forState:UIControlStateNormal];
        self.btNumOfRightQuestion.userInteractionEnabled = NO;
        
        [self addSubview:self.btNumOfRightQuestion];
    }
    
    if (nil == self.labelCurQuestionIndex) {
        CGRect frameOfLabel;
        frameOfLabel.origin.x = DISTANCE_PER_CONTROL + self.btNumOfRightQuestion.frame.origin.x + self.btNumOfRightQuestion.frame.size.width;
        frameOfLabel.size.width = WIDTH_OF_CONTROL;
        frameOfLabel.size.height = 32;
        frameOfLabel.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR/2 - frameOfLabel.size.height/2; //由center决定控件的y坐标
        
        self.labelCurQuestionIndex = [[UILabel alloc] initWithFrame:frameOfLabel];
        [self.labelCurQuestionIndex setText:@"0/0"];
        
        [self addSubview:self.labelCurQuestionIndex];
    }
    
    if (nil == allQuestionIndexCollectionView) {
        CGRect frameOfBottomCollectionView;
        frameOfBottomCollectionView.origin.x = 0;
        frameOfBottomCollectionView.size.width = self.frame.size.width;
        frameOfBottomCollectionView.size.height = HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
        frameOfBottomCollectionView.origin.y = HEIGHT_OF_PRACTICE_TOP_TOOLBAR;
        
        //collect view 布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(32, 32);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.headerReferenceSize = CGSizeMake(frameOfBottomCollectionView.size.width, 20);
        
        allQuestionIndexCollectionView = [[UICollectionView alloc] initWithFrame:frameOfBottomCollectionView collectionViewLayout:layout];
        
        allQuestionIndexCollectionView.delegate = self;
        allQuestionIndexCollectionView.dataSource = self;
        [allQuestionIndexCollectionView registerNib:[UINib nibWithNibName:@"WMHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER_VIEW"];
        [allQuestionIndexCollectionView registerNib:[UINib nibWithNibName:@"WMquestionIndexCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"QuestionIndexCell"];
        [allQuestionIndexCollectionView setBackgroundColor:[UIColor whiteColor]];
        
        [self addSubview:allQuestionIndexCollectionView];
    }
    
    [self.labelCurQuestionIndex setText:[NSString stringWithFormat:@"%ld/%ld",self.currentQuestionIndex+1,self.totalQuestionNum]];
    [self.btNumOfErrorQuestion setTitle:[NSString stringWithFormat:@"%ld",self.numOfWrongAnswer] forState:UIControlStateNormal];
    [self.btNumOfRightQuestion setTitle:[NSString stringWithFormat:@"%ld",self.numOfCorrectAnswer] forState:UIControlStateNormal];
}

#pragma mark - question index collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.sectionInfos count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSDictionary *dic = [self.sectionInfos objectAtIndex:section];
    NSInteger num = ((NSNumber *)[dic objectForKey:@"sectionNum"]).integerValue;
    return num;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WMquestionIndexCollectionViewCell *cell = (WMquestionIndexCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"QuestionIndexCell" forIndexPath:indexPath];
    
    NSString *title = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    [cell.labelQuestionIndex setText:title];
    
    
    NSInteger num = 0;
    for (NSInteger i = 0; i < indexPath.section; i++) {
        NSDictionary *dic = [self.sectionInfos objectAtIndex:i];
        num += ((NSNumber *)[dic objectForKey:@"sectionNum"]).integerValue;
    }
    
    if (indexPath.row + num == self.currentQuestionIndex) {
        cell.isSelected = YES;
    } else
        cell.isSelected = NO;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        WMHeaderCollectionReusableView *header = (WMHeaderCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER_VIEW" forIndexPath:indexPath];
        
        NSString *sectionTitle = [self.sectionInfos[indexPath.section] objectForKey:@"sectionName"];
        sectionTitle = [NSString stringWithFormat:@"%ld. %@",indexPath.section+1,sectionTitle];
        [header.labelSectionTitle setText:sectionTitle];
        
        view = header;
    }
    return view;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 10, 5);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSInteger index = 0;
    for (int i = 0; i < indexPath.section; i++) {
        NSNumber *sectionNum = (NSNumber *)[self.sectionInfos[i] objectForKey:@"sectionNum"];
        index += sectionNum.integerValue;
    }
    index += indexPath.row;
    
    [_delegate chooseQuestionIndex:index];
    
    [self popDownToolBar];
}

#pragma mark - acion of outlet
- (void)touchUpInsideOfBackgroundButton:(id)sender
{
//    [_delegate touchUpInsideOfToolBar:self];
    
    CGRect frame = self.frame;
    CGRect frameOfSuperView = self.superview.frame;
    
    if (frame.origin.y == frameOfSuperView.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR) {
        frame.origin.y -= HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
    } else if (frame.origin.y == frameOfSuperView.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR){
        frame.origin.y += HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = frame;
    }];
    
}

- (void)touchUpInsideOfCollect:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    if (bt.tag == 0) {
        bt.tag = 1;
        [bt setImage:[UIImage imageNamed:@"starFill"] forState:UIControlStateNormal];
        [bt setTitle:@"已收藏" forState:UIControlStateNormal];
    } else {
        bt.tag = 0;
        [bt setImage:[UIImage imageNamed:@"starEmpty"] forState:UIControlStateNormal];
        [bt setTitle:@"   收藏" forState:UIControlStateNormal];
    }
}



#pragma mark - pan gesture
- (void)moveToolBar:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:self];
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            startPanPoint = point;
            previousPanPoint = point;
            frameBeforePan = self.frame;
            NSLog(@"begin point: %@",NSStringFromCGPoint(point));
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat locationY = point.y - previousPanPoint.y;
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + locationY, self.frame.size.width, self.frame.size.height)];
            previousPanPoint = point;
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat locationY = point.y - startPanPoint.y;
            CGRect frameOfSuperView = self.superview.frame;
            
            //滑动之前已经是弹出状态
            if (frameBeforePan.origin.y <= frameOfSuperView.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR) {
                if (locationY > 0 && fabs(locationY) >= self.frame.size.height / 3) { //向下拉
                    [self popDownToolBar];
                } else {
                    [self popUpToolBar];
                }
            } else { //闭合状态
                if (locationY < 0 && fabs(locationY) >= self.frame.size.height / 4) { //向上拉
                    [self popUpToolBar];
                } else {
                    [self popDownToolBar];
                }
            }
        }
            break;
        default:
            break;
    }

}

- (void)popUpToolBar
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        CGRect frameOfSuperView = self.superview.frame;
        frame.origin.y = frameOfSuperView.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR - HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
        self.frame = frame;
    }];
}

- (void)popDownToolBar
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        CGRect frameOfSuperView = self.superview.frame;
        frame.origin.y = frameOfSuperView.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR;
        self.frame = frame;
    }];
}

@end
