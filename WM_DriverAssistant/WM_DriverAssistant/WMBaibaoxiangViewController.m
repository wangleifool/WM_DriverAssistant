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


#define imageCount      3

@interface WMBaibaoxiangViewController ()
{
    UIView           *backView;
    
    UICollectionView *collectionView1;
    UICollectionView *collectionView2;
    
    NSInteger        currentPage;
}
@property(nonatomic,strong)NSArray *btnTitles;
@property(nonatomic,strong)NSArray *btnTitles1;
@property(nonatomic,strong)NSArray *btnTitles2;
@property(nonatomic,strong)NSArray *btnImages;
@property(nonatomic,strong)UIScrollView *scrollView;


@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,strong)WM_SecondCollection *secondCollectionView;
@property(nonatomic,strong)UIView *cutView;

@property(nonatomic,strong)UIImageView      *ADImageView;
@property(nonatomic,strong)UIPageControl    *pageControl;
@property(nonatomic,strong)UIScrollView     *mainScrollview;
@property(nonatomic,strong)CATransition     *transition;

@end



@implementation WMBaibaoxiangViewController

#pragma mark - 属性的getter方法
-(UIImageView *)ADImageView
{
    if (!_ADImageView) {
        _ADImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, collectionView1.frame.origin.y+collectionView1.frame.size.height, kScreenWidth, 150)];
        _ADImageView.image = [UIImage imageNamed:@"0.jpg"];
        UISwipeGestureRecognizer *leftSwipGS = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwip:)];
        leftSwipGS.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.view addGestureRecognizer:leftSwipGS];
        UISwipeGestureRecognizer *rightSwipGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwip:)];
        rightSwipGes.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:rightSwipGes];
        
    }
    return _ADImageView;
}
-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth-40)/2, self.ADImageView.frame.origin.y+108, 40, 37)];
        _pageControl.numberOfPages = 3;
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}
-(UIScrollView *)mainScrollview
{
    if (!_mainScrollview) {
        _mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49)];
        _mainScrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _mainScrollview.scrollEnabled = YES;
        _mainScrollview.showsVerticalScrollIndicator = NO;
        
    }
    return _mainScrollview;
}
-(CATransition *)transition
{
    if (!_transition) {
        _transition = [[CATransition alloc] init];
        _transition.type = kCATransitionPush;
        _transition.duration = 1;
    }
    return _transition;
}

#pragma mark - 轮播图片的手势操作
-(void)leftSwip:(UISwipeGestureRecognizer *)gesture
{
    
    [self transationAnimation:YES];
    
}
-(void)rightSwip:(UISwipeGestureRecognizer *)gesture
{
    [self transationAnimation:NO];
    
}
-(void)transationAnimation:(BOOL)isNext
{
    if (isNext) {
        self.transition.subtype = kCATransitionFromRight;
    }
    else
    {
        self.transition.subtype = kCATransitionFromLeft;
    }

    self.ADImageView.image = [self getImage:isNext];
    [_ADImageView.layer addAnimation:self.transition forKey:@"KCTransitionAnimation"];
}
#pragma mark - 自动轮播
-(void)autoNextImage
{
    [self transationAnimation:YES];
}
-(UIImage *)getImage:(BOOL)isNext
{
    if (isNext)
    {
        currentPage = (currentPage+1)%imageCount;
    }
    else
    {
        currentPage = (currentPage-1+imageCount)%imageCount;
    }
    self.pageControl.currentPage = currentPage;
    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)currentPage];
    return [UIImage imageNamed:imageName];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_timer invalidate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navView.title.text = @"百宝箱";
    [self initData];
    [self initUI];
    [self addTimer];
}
-(void)initUI
{
    [self createBannerWidget];
    [self initCollectionView];
    [self.contentView addSubview:self.mainScrollview];
    [self.mainScrollview addSubview:self.pageControl];
}
#pragma mark - 初始化数据
-(void)initData
{
    _btnTitles = @[@"精品二手车",@"短期理财",@"我要贷款",@"办信用卡"];
    _btnImages = @[@"xiaoche.png",@"icon_bm_school.png",@"icon_bm_top.png",@"icon_bm_zixue.png"];
    _btnTitles1 = @[@"大牌车品",@"金银猫理财",@"真心话",@"买车狂欢惠",@"享7亿红包",@"玩转双十一",@"眼力大比评",@"免费约驾",@"测星座福地",@"手机借款",@"办理信用卡"];
    _btnTitles2 = @[@"测星座福地",@"砸金蛋",@"解锁星座",@"手机借款",@"办理信用卡",@"车险资讯",@"汽车头条",@"免费测保费",@"二手车",@"聊聊学车",@"帮选车",@"更多"];
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
//    //设置cell的大小
//    layout.itemSize = CGSizeMake(kScreenWidth/4, 100);
    //初始化collectionView1
    collectionView1 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth, 360) collectionViewLayout:layout];
    collectionView1.tag = 10;
    collectionView1.backgroundColor = [UIColor whiteColor];
    collectionView1.delegate = self;
    collectionView1.dataSource = self;
    collectionView1.scrollEnabled = NO;
    [collectionView1 registerClass:[WM_CollectionViewCell class] forCellWithReuseIdentifier:@"collection1Cell"];
    [self.mainScrollview addSubview:collectionView1];
    [self.mainScrollview addSubview:self.ADImageView];
    [self initCutLine];
    //初始化layout
    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc] init];
    //设置垂直间距
    layout2.minimumLineSpacing = 0;
    //设置水平间距
    layout2.minimumInteritemSpacing = 0;
    //设置布局方向
    layout2.scrollDirection = UICollectionViewScrollDirectionVertical;
//    //设置cell的大小
//    layout2.itemSize = CGSizeMake(kScreenWidth/4, 100);
    //初始化collectionView1
    collectionView2 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.ADImageView.frame.origin.y+self.ADImageView.frame.size.height+30, kScreenWidth, 360) collectionViewLayout:layout2];
    collectionView2.tag = 11;
    collectionView2.backgroundColor = [UIColor whiteColor];
    collectionView2.delegate = self;
    collectionView2.dataSource = self;
    collectionView2.scrollEnabled = NO;
    [collectionView2 registerClass:[WM_CollectionViewCell class] forCellWithReuseIdentifier:@"collection1Cell"];
    
    if (collectionView2.frame.origin.y+collectionView2.frame.size.height > _mainScrollview.contentSize.height) {
        _mainScrollview.contentSize = CGSizeMake(kScreenWidth, collectionView2.frame.origin.y+collectionView2.frame.size.height);
    }
    [_mainScrollview addSubview:collectionView2];
    
}
-(void)createBannerWidget
{
    for (int i=0; i<4; i++)
    {
        WM_MyButton *myButton = [WM_MyButton buttonWithType:UIButtonTypeCustom];
        myButton = [[WM_MyButton alloc] initWithFrame:CGRectMake(kScreenWidth/4*i, 0, kScreenWidth/4, 80)];
        [myButton setTitle:[_btnTitles objectAtIndex:i] forState:UIControlStateNormal];
        [myButton setImage:[UIImage imageNamed:[_btnImages objectAtIndex:i]] forState:UIControlStateNormal];;
        myButton.backgroundColor = [UIColor blueColor];
        myButton.tag = 100+i;
        [myButton addTarget:self action:@selector(banerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.mainScrollview addSubview:myButton];
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
    _cutView = [[UIView alloc] initWithFrame:CGRectMake(0, _ADImageView.frame.origin.y+_ADImageView.frame.size.height, kScreenWidth, 30)];
    _cutView.backgroundColor = [UIColor whiteColor];
    [_mainScrollview addSubview:_cutView];
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
            return CGSizeMake(kScreenWidth/2, 120);
        }
        else
        {
            return CGSizeMake(kScreenWidth/4, 120);
        }
    }
    
    else
    {
        return CGSizeMake(kScreenWidth/4, 120);
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


-(void)buttonClicked:(WM_BanerView *)view
{
    //if ([view.titleLab.text isEqualToString:@"精品二手车"])
    {
        NSLog(@"精品二手车%@",view.titleLab.text);
    }
}


#pragma mark 添加定时器
-(void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoNextImage) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
