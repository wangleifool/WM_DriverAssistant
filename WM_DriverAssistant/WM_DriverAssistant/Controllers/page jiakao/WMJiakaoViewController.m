//
//  WMJiakaoViewController.m
//  WM_DriverAssistant

//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//
/*
    需要做的事情：
    1.继承父类的导航栏属性，并自定义navagation title
    2.作为科目1 到 拿本 ，五个独立视图控制器的根载体。在此处通过封装好的scrollView，添加到本视图作为子视图

 */


#import "WMJiakaoViewController.h"
#import "WMPagesScrollView.h"
#import "AppDelegate.h"


@interface WMJiakaoViewController () <UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
    WMPagesScrollView *WMscrollView;
    
    
    NSMutableArray  *arrayOfTitleButtons;
    NSInteger selectedPage;
    CGRect  selfFrame;
    
}


@property (strong,nonatomic) UIScrollView *topTitleScrollView;
@property (strong,nonatomic) UIView       *topTitleBottomLine;  //标题下面的横线指示
@property (strong,nonatomic) UIScrollView *mainContentScrollView;
@property (copy, nonatomic) NSMutableArray *arrayOfViewControllers;
@property (copy, nonatomic) NSArray *arrayOfTitles;


@end

@implementation WMJiakaoViewController

#pragma mark - 懒加载
- (NSMutableArray *)arrayOfViewControllers
{
    if (nil == _arrayOfViewControllers) {
        _arrayOfViewControllers = [NSMutableArray arrayWithObjects:@"WMSubjectOneViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController", nil];
    }
    return _arrayOfViewControllers;
}

- (NSArray *)arrayOfTitles
{
    if (nil == _arrayOfTitles) {
        _arrayOfTitles = @[@"科目一",@"科目二",@"科目三",@"科目四",@"拿本"];
    }
    return _arrayOfTitles;
}

- (UIScrollView *)topTitleScrollView
{
    if (nil == _topTitleScrollView) {
        
        _topTitleScrollView = [[UIScrollView alloc] init];
        
        
        CGFloat widthPerTitleItem = selfFrame.size.width / self.arrayOfTitles.count; //计算标题按钮的宽度
        
        _topTitleScrollView.frame = CGRectMake(0, TOP_SPACE+selfFrame.origin.y, widthPerTitleItem*self.arrayOfTitles.count, TOP_SCROLL_VIEW_HEIGHT);
        _topTitleScrollView.contentSize = CGSizeMake(widthPerTitleItem*self.arrayOfTitles.count, 0);
        _topTitleScrollView.showsHorizontalScrollIndicator = NO;
        [_topTitleScrollView setBackgroundColor:[UIColor whiteColor]];
        
        //设置顶部滑动视图上的标题按钮
        arrayOfTitleButtons = [NSMutableArray array];
        for (int x = 0; x < [self.arrayOfTitles count]; x++) {
            UIButton *btTitle = [[UIButton alloc] init];
            CGRect frame = CGRectMake(x*widthPerTitleItem, 0, widthPerTitleItem, TOP_SCROLL_VIEW_HEIGHT - LINE_BOTTOM_HEIGHT);
            btTitle.frame = frame;
            
            btTitle.tag = x;
            [btTitle setTitle:self.arrayOfTitles[x] forState:UIControlStateNormal];
            [btTitle addTarget:self action:@selector(titleButtonTouchAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [arrayOfTitleButtons addObject:btTitle];
            [_topTitleScrollView addSubview:btTitle];
        }
        [self updateSelectedPage:0]; //初始化选中第一个页面（后期需要保存上次选中数据）
        
        //设置顶部滑动视图下面的横线
        _topTitleBottomLine = [[UIView alloc] init];
        _topTitleBottomLine.frame = CGRectMake(0, TOP_SCROLL_VIEW_HEIGHT - LINE_BOTTOM_HEIGHT, widthPerTitleItem, LINE_BOTTOM_HEIGHT);
        [_topTitleBottomLine setBackgroundColor:SELECTED_COLOR];
        
        [_topTitleScrollView addSubview:_topTitleBottomLine];
    }
    
    return _topTitleScrollView;
}

- (UIScrollView *)mainContentScrollView
{
    if (nil == _mainContentScrollView) {
        
        _mainContentScrollView = [[UIScrollView alloc] init];
        
        _mainContentScrollView.frame = CGRectMake(0, selfFrame.origin.y+TOP_SPACE+ TOP_SCROLL_VIEW_HEIGHT, selfFrame.size.width, selfFrame.size.height);
        
        _mainContentScrollView.contentSize = CGSizeMake(selfFrame.size.width*self.arrayOfTitles.count, 0);
        _mainContentScrollView.delegate = self;
        [_mainContentScrollView setBackgroundColor:[UIColor whiteColor]];
        _mainContentScrollView.pagingEnabled = YES;
        
        [self addObserver:self forKeyPath:@"selectedPage" options:NSKeyValueObservingOptionNew context:nil];
        [self setCurrentPage:0];
    }
    
    return _mainContentScrollView;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    //自定义导航栏
    [self setNavigationTitleView:nil];
    
    
    //添加内容视图
//    NSArray *arrayTitles = [NSArray arrayWithObjects:@"科一",@"科二",@"科三",@"科四",@"拿本", nil];
//    NSArray *arrayControllers = [NSArray arrayWithObjects:@"WMSubjectOneViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController",@"WMSubjectTwoViewController", nil];
//    WMscrollView = [[WMPagesScrollView alloc] initWithFrame:CGRectMake(0, NavBarHeight7, ScreenWidth, ScreenHeight) withTitles:arrayTitles withViewControllers:arrayControllers];
//    
//    WMscrollView.rootVC = self;
//    [self.contentView addSubview:WMscrollView];
//    [WMscrollView setBackgroundColor:[UIColor lightGrayColor]];
    
//    appDelegate.jiakaoViewController = self;
    
    
    [self addNotification];
}

- (void)viewWillAppear:(BOOL)animated
{
    
//    NSLog(@"page jia kao show");
//    if (appDelegate.pubSubjectOneVC) {
//        [appDelegate.pubSubjectOneVC viewWillAppear:YES];
//    }
}

- (void)viewDidLayoutSubviews
{
    selfFrame = self.contentView.frame;
    selfFrame.origin.y = NavBarHeight7;
    selfFrame.size.height -= (NavBarHeight7 + TabBarHeight);
    [self.contentView addSubview:self.topTitleScrollView];
    [self.contentView addSubview:self.mainContentScrollView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self removeNotification];
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLeftViewInPageJiakao:) name:@"showLeftViewInPageJiakao" object:nil];
}

- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showLeftViewInPageJiakao" object:nil];
}



#pragma mark - 自定义导航栏
- (void)setNavigationTitleView:(UIView *)customView
{
    NSLog(@"setNavigationTitleView in WMJiakaoViewController");
    self.navigationItem.title = @"驾考";
}

-(void)ShowLeftView
{
    if (showLeftView)
    {
        showLeftView = false;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = WMscrollView.frame;
            
            if (IsiPad) {
                frame.origin.x = ScreenWidth - 200;
            } else {
                frame.origin.x = ScreenWidth - 100;
            }
            
            WMscrollView.frame = frame;
            self.UserView.alpha = 1;
        }];
    }
    else
    {
        showLeftView = true;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = WMscrollView.frame;
            frame.origin.x = 0;
            WMscrollView.frame = frame;
            self.UserView.alpha = 0;
        }];
    }
    
}

#pragma mark - 主滑动视图相关
- (void)updateSelectedPage:(NSInteger)page
{
    for (UIButton *btTitle in arrayOfTitleButtons) {
        if (btTitle.tag == page) {
            [btTitle setTitleColor:SELECTED_COLOR forState:UIControlStateNormal];
        } else {
            [btTitle setTitleColor:UNSELECTED_COLOR forState:UIControlStateNormal];
        }
    }
}

- (void)titleButtonTouchAction:(id)sender
{
    UIButton *btTitle = ((UIButton *)sender);
    [self setCurrentPage:btTitle.tag];
    CGPoint pageOffset = CGPointMake(btTitle.tag * selfFrame.size.width, 0);
    [self.mainContentScrollView setContentOffset:pageOffset];
    
    //
    [self updateSelectedPage:btTitle.tag];
}

- (void)setCurrentPage:(NSInteger)page
{
    [self willChangeValueForKey:@"selectedPage"];
    selectedPage = page;
    [self didChangeValueForKey:@"selectedPage"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object == self) {
        if ([keyPath isEqualToString:@"selectedPage"]) {
            NSInteger page = [change[@"new"] integerValue];
            
            for (NSInteger i = 0; i < self.arrayOfViewControllers.count; i++) {
                if (page == i) {
                    NSString *className = self.arrayOfViewControllers[i];
                    if ([className isEqualToString:@"VC_Already_Created"]) {
                        return ;
                    }
                    
                    UIViewController *VC = [[NSClassFromString(className) alloc] init];
                    CGRect frame = CGRectMake(selfFrame.size.width * i, 0, selfFrame.size.width, selfFrame.size.height - self.topTitleScrollView.bounds.size.height);
                    VC.view.frame = frame;
                    
                    //该label和需要实现的功能无关，只是测试。
                    //                    UILabel *labelTest = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 30)];
                    //                    [labelTest setText:[NSString stringWithFormat:@"This is %dst viewController",i+1]];
                    //                    [VC.view addSubview:labelTest];
                    
                    [self.mainContentScrollView addSubview:VC.view];
                    [self addChildViewController:VC];
                    self.arrayOfViewControllers[i] = @"VC_Already_Created";
                }
            }
        }
    }
}

- (CGFloat)getBottomLineOffsetWithMainScrollOffset:(CGFloat)offset
{
    CGFloat widthPerTitleItem = selfFrame.size.width / self.arrayOfTitles.count; //计算标题按钮的宽度
    CGFloat bottomLineOffset = offset * widthPerTitleItem / selfFrame.size.width;
    return bottomLineOffset;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //最左侧，弹出左侧视图
    static BOOL showOncePerTime = YES;
    
    CGFloat widthPerTitleItem = selfFrame.size.width / self.arrayOfTitles.count; //计算标题按钮的宽度
    
    if (scrollView.contentOffset.x < 0 && showOncePerTime) {
        showOncePerTime = NO;
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"showLeftViewInPageJiakao" object:nil];
    } else if (scrollView.contentOffset.x >= 0){
        showOncePerTime = YES;
    }
    
    //不需要处理的位置信息
    if (scrollView.contentOffset.x < 0 || scrollView.contentOffset.x > selfFrame.size.width * self.arrayOfTitles.count)
        return ;
    else {
        
    }
    
    //实时计算标题下划线的位置
    _topTitleBottomLine.center = CGPointMake([self getBottomLineOffsetWithMainScrollOffset:scrollView.contentOffset.x] + widthPerTitleItem/2, _topTitleBottomLine.center.y);
    _topTitleBottomLine.bounds = CGRectMake(0, 0, widthPerTitleItem, LINE_BOTTOM_HEIGHT);
    
    //如果视图滑动距离，超过宽度一半。修改当前选中title
    NSInteger page = (scrollView.contentOffset.x + selfFrame.size.width / 2) / selfFrame.size.width;
    [self updateSelectedPage:page];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //停止滑动手势，如果视图滑动距离，超过宽度一半。修改当前显示页面
    NSInteger page = (scrollView.contentOffset.x + selfFrame.size.width / 2) / selfFrame.size.width;
    [self setCurrentPage:page];
}

#pragma mark - Notification
- (void)showLeftViewInPageJiakao:(NSNotification *)notification
{
    [self ShowLeftView];
}
@end
