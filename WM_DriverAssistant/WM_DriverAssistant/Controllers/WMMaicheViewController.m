//
//  WMMaicheViewController.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMMaicheViewController.h"
#import "WMAllTypeCarViewController.h"
#import "WMSelectCarViewController.h"
#import "WMSecondHandCarViewController.h"

#define WidthPerNavigationTitle 64
#define NavigationTitleTopSpace 2
#define NavigationTitleBottomSpace 2

@interface WMMaicheViewController () <UIScrollViewDelegate>
{
    
}

@property (copy, nonatomic) NSDictionary *dicOfSubVC;
@property (copy, nonatomic) NSMutableArray *arrayOfTitleButtons;
@property (strong, nonatomic) UIScrollView *mainScrollView;
@property (strong, nonatomic) UIView       *navTitleView;
@property (strong, nonatomic) UIView       *bottomLine;

@end

@implementation WMMaicheViewController

#pragma mark - 懒加载
- (NSMutableArray *)arrayOfTitleButtons
{
    if (nil == _arrayOfTitleButtons) {
        _arrayOfTitleButtons = [NSMutableArray array];
    }
    return _arrayOfTitleButtons;
}
- (NSDictionary *)dicOfSubVC
{
    if (nil == _dicOfSubVC) {
        _dicOfSubVC = @{@"title":@[@"车型",@"选车",@"二手车"],
                        @"className":@[@"WMAllTypeCarViewController",@"WMSelectCarViewController",@"WMSecondHandCarViewController"]};
    }
    return _dicOfSubVC;
}

- (UIScrollView *)mainScrollView
{
    if (nil == _mainScrollView) {
        NSArray *allSubVCClassName = [self.dicOfSubVC objectForKey:@"className"];
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width*allSubVCClassName.count, 0);
        _mainScrollView.delegate = self;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        
        CGRect frame;
        for (NSInteger i = 0; i < allSubVCClassName.count; i++) {
            frame = CGRectMake(i*_mainScrollView.frame.size.width, 0, _mainScrollView.frame.size.width, _mainScrollView.bounds.size.height-NavBarHeight7-TabBarHeight);
            
            UIViewController *vc = [[NSClassFromString(allSubVCClassName[i]) alloc] init];
            vc.view.frame = frame;
            [_mainScrollView addSubview:vc.view];
            [self addChildViewController:vc];
        }
    }
    return _mainScrollView;
}

- (UIView *)navTitleView
{
    if (nil == _navTitleView) {
        
        NSArray *allNavigationTitle = [self.dicOfSubVC objectForKey:@"title"];
        _navTitleView = [[UIView alloc] init];
        CGFloat sizeW = WidthPerNavigationTitle * allNavigationTitle.count;
        CGFloat sizeH = NavBarHeight - NavigationTitleTopSpace - NavigationTitleBottomSpace;
        CGFloat originY = NavigationTitleTopSpace;
//        CGFloat originX = (self.navigationController.navigationBar.bounds.size.width - sizeW)/2;
        _navTitleView.frame = CGRectMake(0, originY, sizeW, sizeH);
//        [_navTitleView setBackgroundColor:[UIColor redColor]];
        
        for (int i = 0; i < allNavigationTitle.count ; i++) {
            UIButton *btTitle = [[UIButton alloc] init];
            btTitle.frame = CGRectMake(i*WidthPerNavigationTitle, 0, WidthPerNavigationTitle, sizeH-4-2); //height 是 减去 下划线的高度 和 间隔距离
            [btTitle setTitle:allNavigationTitle[i] forState:UIControlStateNormal];
            [btTitle setTitleColor:UNSELECTED_COLOR forState:UIControlStateNormal];
            btTitle.tag = i;
            [btTitle addTarget:self action:@selector(actionOfNavigationTitle:) forControlEvents:UIControlEventTouchUpInside];
            
            [_navTitleView addSubview:btTitle];
            [self.arrayOfTitleButtons addObject:btTitle];
        }
        [self updateSelectedPage:0];
        
        self.bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, sizeH - 4, WidthPerNavigationTitle, 2)];
        [self.bottomLine setBackgroundColor:SELECTED_COLOR];
        [_navTitleView addSubview:self.bottomLine];
        
    }
    return _navTitleView;
}

#pragma mark - vc 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.        
    
    self.navigationItem.titleView = self.navTitleView;
}

- (void)viewDidLayoutSubviews
{
    [self.view addSubview:self.mainScrollView];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigation title view
- (void)actionOfNavigationTitle:(id)sender
{
    UIButton *btTitle = (UIButton *)sender;
    
    CGPoint contentOffset = self.mainScrollView.contentOffset;
    contentOffset.x = btTitle.tag * self.mainScrollView.bounds.size.width;
    [self.mainScrollView setContentOffset:contentOffset animated:NO];
}

- (void)updateSelectedPage:(NSInteger)index
{
    for (UIButton *btTitle in self.arrayOfTitleButtons) {
        if (btTitle.tag == index) {
            [btTitle setTitleColor:SELECTED_COLOR forState:UIControlStateNormal];
        } else {
            [btTitle setTitleColor:UNSELECTED_COLOR forState:UIControlStateNormal];
        }
    }
 
}


#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //不需要处理的位置
    if (offsetX < 0 || offsetX > self.arrayOfTitleButtons.count*scrollView.bounds.size.width) {
        return ;
    }
    
    CGFloat offsetOfBottomLine = offsetX * self.bottomLine.bounds.size.width / scrollView.bounds.size.width;
    CGPoint centerOfBottomLine = self.bottomLine.center;
    centerOfBottomLine.x = offsetOfBottomLine + self.bottomLine.bounds.size.width/2;
    self.bottomLine.center = centerOfBottomLine;
    
    NSInteger pageIndex = (offsetX + scrollView.bounds.size.width/2) / scrollView.bounds.size.width;
    [self updateSelectedPage:pageIndex];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //不需要处理的位置
    if (offsetX < 0 || offsetX > self.arrayOfTitleButtons.count*scrollView.bounds.size.width) {
        return ;
    }
    
    NSInteger pageIndex = (offsetX + scrollView.bounds.size.width/2) / scrollView.bounds.size.width;
    [self updateSelectedPage:pageIndex];
    
}

@end
