//
//  WMBaiBaoXiangViewController.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import "WMBaibaoxiangViewController.h"
#import "WM_BanerView.h"
#import "WM_CollectionViewCell.h"
#import "WM_MyButton.h"



#define kScreenWidth   768//([UIScreen mainScreen].bounds.size.width)
#define kScreenHight   ([UIScreen mainScreen].bounds.size.height)
#define imageCount      3

@interface WMBaibaoxiangViewController ()
{
    UIView           *backView;
    UIScrollView     *mainScrollview;
    UICollectionView *collectionView1;
    UICollectionView *collectionView2;
    
    UIImageView      *_leftImageView;
    UIImageView      *_centerImageView;
    UIImageView      *_rightImageView;
    UIPageControl    *_pageControl;
    NSInteger        currentPage;
}
@end



@implementation WMBaibaoxiangViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _btnTitles = @[@"精品二手车",@"短期理财",@"我要贷款",@"办信用卡"];
    _btnImages = @[@"xiaoche.png",@"icon_bm_school.png",@"icon_bm_top.png",@"icon_bm_zixue.png"];
    _btnTitles1 = @[@"大牌车品",@"金银猫理财",@"真心话",@"买车狂欢惠",@"享7亿红包",@"玩转双十一",@"眼力大比评",@"免费约驾",@"测星座福地",@"手机借款",@"办理信用卡"];
    _btnTitles2 = @[@"测星座福地",@"砸金蛋",@"解锁星座",@"手机借款",@"办理信用卡",@"车险资讯",@"汽车头条",@"免费测保费",@"二手车",@"聊聊学车",@"帮选车",@"更多"];

    mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 768, 1024-64)];
    mainScrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    mainScrollview.scrollEnabled = YES;
    mainScrollview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainScrollview];
    [self createBannerWidget];
    [self initCollectionView];
    [self initImageScrollView];
    [self initImageView];
    [self initCutLine];
    [self addTimer];
}
//重写-(void)ShowLeftView
-(void)ShowLeftView
{
    if (showLeftView)
    {
        showLeftView = false;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = mainScrollview.frame;
            frame.origin.x = 618;
            mainScrollview.frame = frame;
            self.UserView.alpha = mainScrollview.frame.origin.x/618;
        }];
    }
    else
    {
        showLeftView = true;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = mainScrollview.frame;
            frame.origin.x = 0;
            mainScrollview.frame = frame;
            self.UserView.alpha = mainScrollview.frame.origin.x/618;
        }];
    }
}

-(void)initCollectionView
{
    //初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置垂直间距
    layout.minimumLineSpacing = 0;
    //设置水平间距
    layout.minimumInteritemSpacing = 0;
    //设置布局方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置cell的大小
    layout.itemSize = CGSizeMake(768/4, 180);
    //初始化collectionView1
    collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, 768, 540) collectionViewLayout:layout];
    collectionView1.tag = 10;
    collectionView1.backgroundColor = [UIColor whiteColor];
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    collectionView1.scrollEnabled = NO;
    [collectionView1 registerClass:[WM_CollectionViewCell class] forCellWithReuseIdentifier:@"collection1Cell"];
    [mainScrollview addSubview:collectionView1];
    
    //初始化layout
    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc] init];
    //设置垂直间距
    layout2.minimumLineSpacing = 0;
    //设置水平间距
    layout2.minimumInteritemSpacing = 0;
    //设置布局方向
    layout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置cell的大小
    layout2.itemSize = CGSizeMake(768/4, 180);
    //初始化collectionView1
    collectionView2 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 860, 768, 540) collectionViewLayout:layout2];
    collectionView2.tag = 11;
    collectionView2.backgroundColor = [UIColor whiteColor];
    collectionView2.delegate = self;
    collectionView2.dataSource = self;
    collectionView2.scrollEnabled = NO;
    [collectionView2 registerClass:[WM_CollectionViewCell class] forCellWithReuseIdentifier:@"collection1Cell"];
    
    if (collectionView2.frame.origin.y+collectionView2.frame.size.height > mainScrollview.contentSize.height) {
        mainScrollview.contentSize = CGSizeMake(kScreenWidth, collectionView2.frame.origin.y+collectionView2.frame.size.height);
    }
    [mainScrollview addSubview:collectionView2];
    
}
-(void)createBannerWidget
{
    for (int i=0; i<4; i++)
    {
        WM_MyButton *myButton = [WM_MyButton buttonWithType:UIButtonTypeCustom];
        myButton = [[WM_MyButton alloc] initWithFrame:CGRectMake(768/4*i, 0, 768/4, 100)];
        [myButton setTitle:[_btnTitles objectAtIndex:i] forState:UIControlStateNormal];
        [myButton setImage:[UIImage imageNamed:[_btnImages objectAtIndex:i]] forState:UIControlStateNormal];;
        myButton.backgroundColor = [UIColor blueColor];
        myButton.tag = 100+i;
        [myButton addTarget:self action:@selector(banerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [mainScrollview addSubview:myButton];
    }
}

-(void)banerButtonClicked:(UIButton *)button
{
    switch (button.tag) {
        case 100:
            NSLog(@"精品二手车");
            break;
        case 101:
            NSLog(@"短期理财");
            break;
        case 102:
            NSLog(@"我要贷款");
            break;
        case 103:
            NSLog(@"办信用卡");
            break;
            
        default:
            break;
    }
}
-(void)initCutLine
{
    _cutView = [[UIView alloc] initWithFrame:CGRectMake(0, _scrollView.frame.origin.y+_scrollView.frame.size.height, kScreenWidth, 30)];
    _cutView.backgroundColor = [UIColor whiteColor];
    [mainScrollview addSubview:_cutView];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((_cutView.frame.size.width-60)/2, 0, 60, 30)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor redColor];
    lab.font = [UIFont systemFontOfSize:13];
    lab.text = @"其他推荐";
    [_cutView addSubview:lab];
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, (_cutView.frame.size.height-1)/2.0, (kScreenWidth - 60)/2-10, 1)];
    line1.backgroundColor = [UIColor grayColor];
    [_cutView addSubview:line1];
    
    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(5+line1.frame.size.width+5+60+5, (_cutView.frame.size.height-1)/2.0, (kScreenWidth - 60)/2-10, 1)];
    line2.backgroundColor = [UIColor grayColor];
    [_cutView addSubview:line2];
}
#pragma mark UICollectionViewDelegate/UICollectionViewDatasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 10)
    {
        return _btnTitles1.count;
    }
    else
    {
        return _btnTitles2.count;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WM_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection1Cell" forIndexPath:indexPath];
    if (collectionView.tag == 10) {
        cell.titleLab.text = [_btnTitles1 objectAtIndex:indexPath.row];
        cell.iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"touxiang%ld.png",indexPath.row+1]];
    }
    else
    {
        cell.titleLab.text = [_btnTitles2 objectAtIndex:indexPath.row];
        cell.iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"touxiang%ld.png",indexPath.row+1]];
    }
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 10)
    {
        if (indexPath.row == 5)
        {
            return CGSizeMake(768/2, 180);
        }
        else
        {
            return CGSizeMake(768/4, 180);
        }
    }
    
    else
    {
        return CGSizeMake(768/4, 180);
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WM_CollectionViewCell *cell = (WM_CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if ([@"大牌车品" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"大牌车品");
    }
    else if ([@"金银猫理财" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"金银猫理财");
    }
    else if ([@"真心话" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"真心话");
    }
    else if ([@"买车狂欢惠" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"买车狂欢惠");
    }
    else if ([@"享7亿红包" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"享7亿红包");
    }
    else if ([@"玩转双十一" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"玩转双十一");
    }
    else if ([@"眼力大比拼" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"眼力大比拼");
    }
    else if ([@"免费约驾" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"免费约驾");
    }
    else if ([@"测星座福地" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"测星座福地");
    }
    else if ([@"手机借款" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"手机借款");
    }
    else if ([@"办理信用卡" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"办理信用卡");
    }
    else if ([@"砸金蛋" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"砸金蛋");
    }
    else if ([@"解锁星座" isEqualToString:cell.titleLab.text])
    {
        NSLog(@"解锁星座");
    }
    
    
}
#pragma mark 创建Image的ScrollView视图
-(void)initImageScrollView
{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 640, 768, 190)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kScreenWidth*3, 190);
    _scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [mainScrollview addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((768-40)/2, 780, 40, 37)];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.currentPage = 0;
    [mainScrollview addSubview:_pageControl];
    
}

-(void)initImageView
{
    //添加左边视图
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 190)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    _leftImageView.image = [UIImage imageNamed:@"2.jpg"];
    [_scrollView addSubview:_leftImageView];
    //添加中间视图
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, 190)];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"0.jpg"]];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    
    //添加右边视图
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, 190)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    _rightImageView.image = [UIImage imageNamed:@"1.jpg"];
    [_scrollView addSubview:_rightImageView];
}

-(void)buttonClicked:(WM_BanerView *)view
{
    //if ([view.titleLab.text isEqualToString:@"精品二手车"])
    {
        NSLog(@"精品二手车%@",view.titleLab.text);
    }
}
#pragma mark 实现UIScrollViewDelegate
//将要滚动时调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}
//滚动结束调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self reloadImage];
    
    [scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
    [self addTimer];
}

#pragma mark 添加定时器
-(void)addTimer
{
    //currentPage = currentPage++;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoNext) userInfo:nil repeats:YES];
}
#pragma mark 切换scrollView上面的图片
-(void)reloadImage
{
    int leftImageIndex, rightImageIndex;
    CGPoint contentOffset = [_scrollView contentOffset];
    if (contentOffset.x > kScreenWidth)//向左滑动
    {
        currentPage = (currentPage + 1) % imageCount;
    }
    else if(contentOffset.x < kScreenWidth)//向右滑动
    {
        currentPage = (currentPage - 1 + imageCount) % imageCount;
    }
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)currentPage]];
    leftImageIndex = (currentPage +imageCount-1)%imageCount;
    rightImageIndex = (currentPage + 1) % imageCount;
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)leftImageIndex]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)rightImageIndex]];
    _pageControl.currentPage = currentPage;

}
-(void)autoNext
{
    int leftImageIndex,rightImageIndex;
    [UIView animateWithDuration:1 animations:^{
        CGFloat scrollX = _scrollView.contentOffset.x;
        scrollX += kScreenWidth;
        _scrollView.contentOffset = CGPointMake(scrollX, 0);
    }];
    
    currentPage = (currentPage + 1) % imageCount;
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)currentPage]];
    leftImageIndex = (currentPage +imageCount-1)%imageCount;
    rightImageIndex = (currentPage + 1) % imageCount;
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)leftImageIndex]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)rightImageIndex]];
    _pageControl.currentPage = currentPage;
    [_scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
