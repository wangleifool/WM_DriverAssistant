//
//  WMCitySelectController.m
//  WM_DriverAssistant
//
//  Created by 梅毅 on 2017/3/13.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMCitySelectController.h"
#import "StateModel.h"
#import "CitiesModel.h"

#define space 13.5
@interface WMCitySelectController ()

@property(nonatomic,strong)NSArray      *dataArray;
@property(nonatomic,strong)UIView       *headerView;
@property(nonatomic,strong)NSArray      *hotCities;

@end

@implementation WMCitySelectController
#pragma mark - 懒加载
-(NSArray *)dataArray
{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil] ;
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSDictionary *dict in arr) {
            StateModel *model = [StateModel stateWithDict:dict];
            [array addObject:model];
        }
        _dataArray = array ;
    }
    return _dataArray;
}
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
        _headerView.backgroundColor = [UIColor colorWithRed:220.0/255 green:219.0/255 blue:220.0/255 alpha:0.5];
        [self hotCity];
    }
    return _headerView;
}
-(void)hotCity
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 30)];
    lab.text = @"热门城市";
    lab.textColor = [UIColor redColor];
    lab.textAlignment = NSTextAlignmentLeft;
    [_headerView addSubview:lab];
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(21+i%3*(110+21), 37.5+i/3*37.5, 110, 30);
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:[self.hotCities objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cityBtnCliked:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:btn];
    }
}
-(void)cityBtnCliked:(UIButton *)button
{
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tableView.tableHeaderView = self.headerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _hotCities = @[@"上海",@"北京",@"广州",@"深圳",@"武汉",@"天津",@"西安",@"南京",@"杭州"];
    self.navigationItem.title = @"选择城市";
    self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexColor = [UIColor blackColor];
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    StateModel *state = [self.dataArray objectAtIndex:section];
    
    return state.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CitySelectID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    StateModel *state = self.dataArray[indexPath.section];
    CitiesModel *city = state.cities[indexPath.row];
    cell.textLabel.text = city.city;
    
    return cell;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *letterArr = [[NSMutableArray alloc] init];
    for (char c = 'A'; c < 'Z'; c++) {
        [letterArr addObject:[NSString stringWithFormat:@"%c",c]];
    }
    [letterArr insertObject:@"#" atIndex:0];
    return letterArr;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    StateModel *state = self.dataArray[section];
    
    return state.state;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
