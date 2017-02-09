//
//  WMExamPracticeViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/22.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMExamPracticeViewController.h"
#import "WMexamPracticeToolBarView.h"
#import "UIView+DMYExtension.h"

@interface WMExamPracticeViewController () <WMexamPracticeToolBarViewDelegate>
{
    WMexamPracticeToolBarView *bottomIndicateToolBar;
}

//内容视图相关属性
/**  */
@property(nonatomic,strong)UIView *leftView;
/**  */
@property(nonatomic,strong)UIView *centerView;
/**  */
@property(nonatomic,strong)UIView *rightView;

@property(nonatomic,assign)CGPoint   start;
@property(nonatomic,assign)NSInteger questionIndex;

@property(nonatomic,assign) BOOL isLeftViewShadow;
@property(nonatomic,assign) BOOL isCenterViewShadow;

@end

@implementation WMExamPracticeViewController

-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
    }
    return _leftView;
}
-(UIView *)centerView{
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
    }
    return _centerView;
}
-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
    }
    return _rightView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //toolbar视图分为上下两部分，初始只显示上面的部分。
    CGRect frameOfToolBar = CGRectMake(0, ScreenHeight - HEIGHT_OF_PRACTICE_TOP_TOOLBAR, self.view.frame.size.width, HEIGHT_OF_PRACTICE_TOP_TOOLBAR+HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR);
    bottomIndicateToolBar = [[WMexamPracticeToolBarView alloc] initWithFrame:frameOfToolBar];
    [self.view addSubview:bottomIndicateToolBar];
    bottomIndicateToolBar.delegate = self;
    
    //题目显示区域,类似翻页卡片
    [self configureContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - content view
- (void)configureContentView
{
    self.questionIndex = 0;
    NSArray * colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
    for (int i = 0; i < 3; i ++) {
        UIView * view = nil;
        if (i == 2)
            view = [[UIView alloc] initWithFrame:CGRectMake(0 * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR)]; //位置和中间视图一样
        else
            view = [[UIView alloc] initWithFrame:CGRectMake((i - 1) * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height - HEIGHT_OF_PRACTICE_TOP_TOOLBAR)];
        
        view.backgroundColor = colorArray[i];
        [self.view addSubview:view];
        switch (i) {
            case 0:
                self.leftView = view;
                break;
            case 1:
                self.centerView = view;
                break;
            case 2:
                self.rightView = view;
                break;
            default:
                break;
        }
    }
    
    
    [self.view sendSubviewToBack:self.rightView];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveView:)]];
}

- (void)addLeftViewShadowEffect
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.leftView.bounds];
    self.leftView.layer.masksToBounds = NO;
    self.leftView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.leftView.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    self.leftView.layer.shadowOpacity = 0.5f;
    self.leftView.layer.shadowPath = shadowPath.CGPath;
    
    self.isLeftViewShadow = YES;
}

- (void)addCenterViewShadowEffect
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.leftView.bounds];
    self.centerView.layer.masksToBounds = NO;
    self.centerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.centerView.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    self.centerView.layer.shadowOpacity = 0.5f;
    self.centerView.layer.shadowPath = shadowPath.CGPath;
    
    self.isCenterViewShadow = YES;
}

- (void)removeLeftViewShadowEffect
{
    self.leftView.layer.masksToBounds = YES;
    self.isLeftViewShadow = NO;
}

- (void)removeCenterViewShadowEffect
{
    self.centerView.layer.masksToBounds = YES;
    self.isCenterViewShadow = NO;
}

-(void)moveView:(UIPanGestureRecognizer *)pan{
    
    
    CGPoint point = [pan locationInView:self.view];
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
                if (self.questionIndex == 0) {
                    return;
                }
                if (!self.isLeftViewShadow) {
                    self.centerView.dmy_x = 0;
                    [self addLeftViewShadowEffect];
                    [self removeCenterViewShadowEffect];
                }
                self.leftView.dmy_x = -self.view.frame.size.width + lenth;
            }else{
                if (!self.isCenterViewShadow) {
                    self.leftView.dmy_x = -self.view.frame.size.width;
                    [self addCenterViewShadowEffect];
                    [self removeLeftViewShadowEffect];
                }
                self.centerView.dmy_x = lenth;
            }
        }
            
            break;
        case UIGestureRecognizerStateEnded:{
            CGFloat lenth = point.x - self.start.x;
            if (lenth > 0 ) {
                if (self.questionIndex == 0) {
                    return;
                }
                if (lenth > self.view.frame.size.width/3) {
                    [UIView animateWithDuration:0.3 animations:^{
                        self.leftView.dmy_x = 0;
                    } completion:^(BOOL finished) {
                        self.questionIndex -= 1;
                        
                        [self removeLeftViewShadowEffect];
                        
                        //左边视图和中间视图互换
                        UIView * view = self.leftView;
                        self.leftView = self.rightView;
                        self.leftView.dmy_x = -self.view.frame.size.width;
                        self.rightView = self.centerView;
                        self.centerView = view;
                        
                        [self.view sendSubviewToBack:self.rightView];
                        [self.view bringSubviewToFront:self.leftView];
                        
                    }];
                }else{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.leftView.dmy_x = -self.view.frame.size.width;
                    } completion:^(BOOL finished) {
                        [self removeLeftViewShadowEffect];
                    }];
                }
            }else{
                lenth = -lenth;
                if (lenth > self.view.frame.size.width/3) {
                    [UIView animateWithDuration:0.3 animations:^{
                        self.centerView.dmy_x = -self.view.frame.size.width;
                    } completion:^(BOOL finished) {
                        self.questionIndex += 1;
                        
                        [self removeCenterViewShadowEffect];
                        
                        //三个视图互换位置
                        UIView * view = self.rightView;
                        self.rightView = self.leftView;
                        self.leftView = self.centerView;
                        self.centerView = view;
                        
                        //微调
                        [self.view sendSubviewToBack:self.rightView];
                        self.rightView.dmy_x = 0;
                        
                    }];
                }else{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.centerView.dmy_x = 0;
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

#pragma mark - WMexamPracticeToolBarViewDelegate
- (void)touchUpInsideOfToolBar:(WMexamPracticeToolBarView *)toolBar
{
//    CGRect frame = bottomIndicateToolBar.frame;
//    frame.origin.y -= HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
//    frame.size.height += HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR;
//    bottomIndicateToolBar.frame = frame;
    
}

- (void)touchUpInsideOfCollect:(WMexamPracticeToolBarView *)toolBar
{
    
}

@end
