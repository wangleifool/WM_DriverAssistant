//
//  WMBaoMingViewController.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import "WMBaomingViewController.h"
#import "JiaXiaoCell.h"
#import "ClassCell.h"

@interface WMBaomingViewController ()

@end

@implementation WMBaomingViewController

-(void)viewWillAppear:(BOOL)animated
{
    _button = [[FxButtonHelper alloc] init];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initBannerData];
    [self initHeaderView];
    [self initFooterView];
}
-(void)LoginClicked
{
    
}
-(void)initBannerData
{
    _arr = @[@"服务保障",@"常见问题",@"报考新规",@"学车流程",@"讨论一下"];
    _icons = @[@"icon_bm_school.png",@"icon_bm_top.png",@"icon_xl_lesson.png",@"icon_km2.png",@"icon_xl_im.png"];
}
-(void)Setting
{
    NSLog(@"hello, world!");
}

#pragma mark 初始化TableView的头视图
-(void)initHeaderView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 200)];
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headView.frame.size.width, 120)];
    //imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"renling_banner.png"];
    [headView addSubview:imageView];
    for (int i = 0; i < 5; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.size.width/5*i, 120, imageView.frame.size.width/5, 90)];
        btn.tag = i+10;
        //btn.titleLabel.textColor = [UIColor grayColor];
        [btn addTarget:self action:@selector(Cliced:) forControlEvents:UIControlEventTouchUpInside];
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
#pragma mark 初始化TableView的底部视图
-(void)initFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-160, 768, 180)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, footerView.frame.size.width, 80);
    [btn setTitle:@"查看更多驾校消息" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(CheckMore:) forControlEvents:UIControlEventTouchUpInside];
    btn.highlighted = YES;
    [footerView addSubview:btn];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((footerView.frame.size.width-150)/2, 130, 150, 25)];
    lab.text = @"是个考驾照 九个用宝典";
    lab.font = [UIFont systemFontOfSize:13];
    lab.textColor = [UIColor grayColor];
    [footerView addSubview:lab];
    self.tableView.tableFooterView = footerView;
}
#pragma mark 查看更多驾校按钮按下
-(void)CheckMore:(UIButton *)sender
{
    NSLog(@"Check More!");
}
-(void)Cliced:(UIButton *)sender
{
    NSLog(@"button cliced!");
}
-(void)BtnClicked:(UIButton *)sender
{
    [_button setButton:sender normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
}
#pragma mark TableViewDelegate/TableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 4;
    }
    
    else if (section == 3 || section == 4)
    {
        return 3;
    }
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
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
            
            return cell;
        }
    }
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            _testBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            _testBtn.frame = CGRectMake(100, 0, 80, 40);
            [_testBtn setTitle:@"教练" forState:UIControlStateNormal];
            [_testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _testBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [_testBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(400, 0, 80, 40)];
            [btn setTitle:@"驾校" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:_testBtn];
            [cell.contentView addSubview:btn];
            
            return cell;
        }
        else if(indexPath.row == 1)
        {
            JiaXiaoCell *cell = [JiaXiaoCell cellWithTableview:tableView];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        
    }
    if ((indexPath.row == 0)&&(indexPath.section != 0)&&(indexPath.section != 1))
    {
        JiaXiaoCell *cell = [JiaXiaoCell cellWithTableview:tableView];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if ((indexPath.section != 0)&&(indexPath.row != 0)) {
        ClassCell *cell = [ClassCell cellWithTableview:tableView];
        return cell;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
