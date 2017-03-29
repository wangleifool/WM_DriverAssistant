//
//  WM_BaoMingView.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WM_BaoMingView.h"
#import "JiaXiaoCell.h"

@interface WM_BaoMingView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)NSArray *icons;

@end

@implementation WM_BaoMingView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBannerData];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-163) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
        self.tableView.contentInset = UIEdgeInsetsZero;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.contentOffset = CGPointZero;
        [self initHeaderView];
        [self addSubview:self.tableView];
        
    }
    return self;
}
-(void)initBannerData
{
    _titles = @[@"推荐",@"类型",@"筛选"];
    _arr = @[@"驾校排行",@"报考新规",@"学车流程",@"学车问答"];
    _icons = @[@"icon_bm_school.png",@"icon_bm_top.png",@"icon_xl_lesson.png",@"icon_km2.png"];
}
-(void)initHeaderView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headView.frame.size.width, 120)];
    //imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"renling_banner.png"];
    [headView addSubview:imageView];
    for (int i = 0; i < 4; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.size.width/4*i, 120, imageView.frame.size.width/4, 90)];
        btn.tag = i+10;
        //btn.titleLabel.textColor = [UIColor grayColor];
        [btn addTarget:self action:@selector(BtnCliced:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((btn.frame.size.width - 80)/2, btn.frame.size.height - 35, 80, 20)];
        lab.text = [_arr objectAtIndex:i];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = [UIColor grayColor];
        lab.font = [UIFont systemFontOfSize:14];
        UIImageView *btnImg = [[UIImageView alloc] initWithFrame:CGRectMake((btn.frame.size.width - 35)/2, 15, 35, 35)];
        //btnImg.backgroundColor = [UIColor greenColor];
        btnImg.image = [UIImage imageNamed:[_icons objectAtIndex:i]];
        [btn addSubview:btnImg];
        [btn addSubview:lab];
        [headView addSubview:btn];
    }
    self.tableView.tableHeaderView = headView;
}
#pragma mark ButtonCliced
-(void)BtnCliced:(UIButton *)button
{
    NSLog(@"BTN Cliced!");
}
#pragma mark - UITableViewDelegate&&UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    else
    {
        return 10;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UILabel *start = [[UILabel alloc] initWithFrame:CGRectMake(5, (cell.frame.size.height - 20)/2, 60, 20)];
            start.text = @"出发地:";
            start.font = [UIFont systemFontOfSize:13];
            [cell.contentView addSubview:start];
            UILabel *intro = [[UILabel alloc] initWithFrame:CGRectMake(65, start.frame.origin.y, 150, 20)];
            intro.text = @"请点击选择您的具体位置";
            intro.font = [UIFont systemFontOfSize:13];
            intro.textColor = [UIColor grayColor];
            [cell.contentView addSubview:intro];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            for (int i = 0; i < 3; i++) {
                UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/3*i, 0, kScreenWidth/3, cell.frame.size.height)];
                lab.text = [_titles objectAtIndex:i];
                lab.textAlignment = NSTextAlignmentCenter;
                lab.textColor = [UIColor blackColor];
                lab.font = [UIFont systemFontOfSize:15];
                [cell.contentView addSubview:lab];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else
        {
            JiaXiaoCell *cell = [JiaXiaoCell cellWithTableview:tableView];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return 44;
        }
        else
        {
            return 100;
        }
    }
    else if(indexPath.section == 0)
    {
        return 44;
    }
    else
    {
        return 100;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}


@end
