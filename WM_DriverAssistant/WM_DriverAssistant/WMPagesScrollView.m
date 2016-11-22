//
//  WMPagesScrollView.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/29.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMPagesScrollView.h"

@interface WMPagesScrollView () <UIScrollViewDelegate>
{
    
    NSArray *arrayOfTitles;
    NSMutableArray  *arrayOfViewControllers;
    NSMutableArray  *arrayOfTitleButtons;
    //UI参数
    CGFloat widthPerTitleItem;
    CGFloat minSpace;
    CGFloat topSpace;
    CGFloat topTitleScrollViewHeight;
    CGRect  selfFrame;
    
    UIColor *selectedColor;
    UIColor *unSelectedColor;
    
    NSInteger selectedPage;
    
}

@property (strong,nonatomic) UIScrollView *topTitleScrollView;
@property (strong,nonatomic) UIView       *topTitleBottomLine;  //标题下面的横线指示
@property (strong,nonatomic) UIScrollView *mainContentScrollView;

@end



@implementation WMPagesScrollView

#pragma mark - 懒加载
- (UIScrollView *)topTitleScrollView
{
    if (nil == _topTitleScrollView) {
        
        _topTitleScrollView = [[UIScrollView alloc] init];
        
        
        _topTitleScrollView.frame = CGRectMake(0, topSpace, widthPerTitleItem*arrayOfTitles.count, topTitleScrollViewHeight);
        _topTitleScrollView.contentSize = CGSizeMake(widthPerTitleItem*arrayOfTitles.count, 0);
        _topTitleScrollView.showsHorizontalScrollIndicator = NO;
        [_topTitleScrollView setBackgroundColor:BACKGROUND_COLOR];
        
        //设置顶部滑动视图上的标题按钮
        arrayOfTitleButtons = [NSMutableArray array];
        for (int x = 0;x < [arrayOfTitles count];x++) {
            UIButton *btTitle = [[UIButton alloc] init];
            CGRect frame = CGRectMake(x*widthPerTitleItem, 0, widthPerTitleItem, topTitleScrollViewHeight - LINE_BOTTOM_HEIGHT);
            btTitle.frame = frame;
            
            btTitle.tag = x;
            [btTitle setTitle:arrayOfTitles[x] forState:UIControlStateNormal];
            [btTitle addTarget:self action:@selector(titleButtonTouchAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [arrayOfTitleButtons addObject:btTitle];
            [_topTitleScrollView addSubview:btTitle];
        }
        [self updateSelectedPage:0]; //初始化选中第一个页面（后期需要保存上次选中数据）
        
        //设置顶部滑动视图下面的横线
        _topTitleBottomLine = [[UIView alloc] init];
        _topTitleBottomLine.frame = CGRectMake(0, topTitleScrollViewHeight - LINE_BOTTOM_HEIGHT, widthPerTitleItem, LINE_BOTTOM_HEIGHT);
        [_topTitleBottomLine setBackgroundColor:selectedColor];
        
        [_topTitleScrollView addSubview:_topTitleBottomLine];
    }
    
    return _topTitleScrollView;
}

- (UIScrollView *)mainContentScrollView
{
    if (nil == _mainContentScrollView) {
        _mainContentScrollView = [[UIScrollView alloc] init];
        _mainContentScrollView.frame = CGRectMake(0, topTitleScrollViewHeight, selfFrame.size.width, selfFrame.size.height);
        
        _mainContentScrollView.contentSize = CGSizeMake(selfFrame.size.width*arrayOfTitles.count, 0);
        _mainContentScrollView.delegate = self;
        [_mainContentScrollView setBackgroundColor:[UIColor whiteColor]];
        _mainContentScrollView.pagingEnabled = YES;
        
        [self addObserver:self forKeyPath:@"selectedPage" options:NSKeyValueObservingOptionNew context:nil];
        [self setCurrentPage:0];
    }
    
    return _mainContentScrollView;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles withViewControllers:(NSArray *)vcs
{
    if (self = [super initWithFrame:frame]) {
        selfFrame = frame;
        arrayOfTitles = titles;
        arrayOfViewControllers = [vcs mutableCopy];
        widthPerTitleItem = frame.size.width / titles.count; //计算标题按钮的宽度
        minSpace = MIN_SPACE;
        topSpace = TOP_SPACE;
        topTitleScrollViewHeight = TOP_SCROLL_VIEW_HEIGHT;
        selectedColor   = SELECTED_COLOR;
        unSelectedColor = UNSELECTED_COLOR;
        
        
    }
    
    return self;
}

//本视图被添加为子视图时，会调用此函数
- (void)layoutSubviews
{
    [self addSubview:self.topTitleScrollView];
    [self addSubview:self.mainContentScrollView];
}


#pragma mark - 事件响应
- (void)titleButtonTouchAction:(id)sender
{
    UIButton *btTitle = ((UIButton *)sender);
    [self setCurrentPage:btTitle.tag];
    CGPoint pageOffset = CGPointMake(btTitle.tag * selfFrame.size.width, 0);
    [self.mainContentScrollView setContentOffset:pageOffset];
    
    //
    [self updateSelectedPage:btTitle.tag];
}

#pragma mark - 标题滑动视图
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

- (CGFloat)getBottomLineOffsetWithMainScrollOffset:(CGFloat)offset
{
    CGFloat bottomLineOffset = offset * widthPerTitleItem / selfFrame.size.width;
    return bottomLineOffset;
}

#pragma mark - 主滑动视图
#pragma mark - main scrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //不需要处理的位置信息
    if (scrollView.contentOffset.x < 0 || scrollView.contentOffset.x > selfFrame.size.width * arrayOfTitles.count)
        return ;
    
    
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

#pragma mark - KVO

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
            
            for (NSInteger i = 0; i < arrayOfViewControllers.count; i++) {
                if (page == i) {
                    NSString *className = arrayOfViewControllers[i];
                    if ([className isEqualToString:@"VC_Already_Created"]) {
                        return ;
                    }
                    
                    UIViewController *VC = [[NSClassFromString(className) alloc] init];
                    CGRect frame = CGRectMake(selfFrame.size.width * i, 0, selfFrame.size.width, self.mainContentScrollView.bounds.size.height);
                    VC.view.frame = frame;
                    
                    
                    //该label和需要实现的功能无关，只是测试。
//                    UILabel *labelTest = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 30)];
//                    [labelTest setText:[NSString stringWithFormat:@"This is %dst viewController",i+1]];
//                    [VC.view addSubview:labelTest];
                    
                    [self.mainContentScrollView addSubview:VC.view];
                    arrayOfViewControllers[i] = @"VC_Already_Created";
                }
            }
        }
    }
}
@end
