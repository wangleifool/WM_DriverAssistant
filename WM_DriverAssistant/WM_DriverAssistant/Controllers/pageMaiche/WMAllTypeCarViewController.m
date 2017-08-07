//
//  WMAllTypeCarViewController.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/4/12.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMAllTypeCarViewController.h"
#import "MJNIndexView.h"
#import "WMMaicheViewController.h"
#import "WMcarOfSomeBrandViewController.h"

@interface WMAllTypeCarViewController () <MJNIndexViewDataSource>
{

}

@property (nonatomic, strong) NSArray *allTableData;
@property (nonatomic, strong) NSMutableArray *allSectionData;
@property (nonatomic, strong) NSString *alphaString;

// MJNIndexView
@property (nonatomic, strong) MJNIndexView *indexView;

@end

@implementation WMAllTypeCarViewController

#pragma mark - 懒加载
- (NSArray *)allTableData
{
    if (nil == _allTableData) {
        
        NSString *pathname = [[NSBundle mainBundle]  pathForResource:@"tableViewData" ofType:@"txt"];
        _allTableData = [[NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
        self.alphaString = @"";
    }
    return _allTableData;
}

- (NSMutableArray *)allSectionData
{
    if (nil == _allSectionData) {
        _allSectionData = [NSMutableArray array];
        
        NSUInteger numberOfFirstLetters = [self countFirstLettersInArray:self.allTableData];
        
        for (int i = 0; i< numberOfFirstLetters; i++) {
            [_allSectionData addObject:[self itemsInSection:i]];
        }
        
    }
    return _allSectionData;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

- (void)viewDidLayoutSubviews
{
    if (nil == self.indexView) {
        // initialise MJNIndexView
        CGRect frameOfIndexView = self.mainTableView.frame;
        
        self.indexView = [[MJNIndexView alloc]initWithFrame:frameOfIndexView];
        self.indexView.dataSource = self;
        [self firstAttributesForMJNIndexView];
        [self.view addSubview:self.indexView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - index view
- (void)firstAttributesForMJNIndexView
{
    
    self.indexView.getSelectedItemsAfterPanGestureIsFinished = NO;
    self.indexView.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0];
    self.indexView.selectedItemFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0];
    self.indexView.backgroundColor = [UIColor clearColor];
    self.indexView.curtainColor = nil;
    self.indexView.curtainFade = 0.0;
    self.indexView.curtainStays = NO;
    self.indexView.curtainMoves = YES;
    self.indexView.curtainMargins = NO;
    self.indexView.ergonomicHeight = NO;
    self.indexView.upperMargin = 22.0;
    self.indexView.lowerMargin = 22.0;
    self.indexView.rightMargin = 10.0;
    self.indexView.itemsAligment = NSTextAlignmentCenter;
    self.indexView.maxItemDeflection = 100.0;
    self.indexView.rangeOfDeflection = 5;
    self.indexView.fontColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    self.indexView.selectedItemFontColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.indexView.darkening = NO;
    self.indexView.fading = YES;
    
}

- (NSArray *)sectionIndexTitlesForMJNIndexView:(MJNIndexView *)indexView
{
    NSMutableArray *results = [NSMutableArray array];
    
    if (nil == self.alphaString || [@"" isEqualToString:self.alphaString]) {
        NSLog(@"%@", self.allSectionData);
    }
    
    for (int i = 0; i < [self.alphaString length]; i++)
    {
        NSString *substr = [self.alphaString substringWithRange:NSMakeRange(i,1)];
        [results addObject:substr];
    }
    
    return results;
}


- (void)sectionForSectionMJNIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self.mainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index] atScrollPosition: UITableViewScrollPositionTop animated:NO];
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.allSectionData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allSectionData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"brandOfCarCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"brandOfCarCell"];
    }
    
    cell.textLabel.font = [UIFont fontWithName:self.indexView.font.fontName size:20.0];
    cell.textLabel.text = [NSString stringWithFormat:@"     %@",[self categoryNameAtIndexPath:indexPath]];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WMMaicheViewController *parentVC = (WMMaicheViewController *)self.parentViewController;
    
    WMcarOfSomeBrandViewController *vc = [[WMcarOfSomeBrandViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [parentVC.navigationController pushViewController:vc animated:YES];
}

#pragma mark - help
- (NSUInteger) countFirstLettersInArray:(NSArray *)categoryArray
{
    NSMutableArray *existingLetters = [NSMutableArray array];
    for (NSString *name in categoryArray){
        if (name == nil || [name isEqualToString:@""])
            continue;
        NSString *firstLetterInName = [name substringToIndex:1];
        NSCharacterSet *notAllowed = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
        NSRange range = [firstLetterInName rangeOfCharacterFromSet:notAllowed];
        
        if (![existingLetters containsObject:firstLetterInName] && range.location == NSNotFound ) {
            [existingLetters addObject:firstLetterInName];
            self.alphaString = [self.alphaString stringByAppendingString:firstLetterInName];
        }
    }
    return [existingLetters count];
}

- (NSArray *) itemsInSection: (NSInteger)section
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[cd] %@",[self firstLetter:section]];
    return [self.allTableData filteredArrayUsingPredicate:predicate];
}

- (NSString *) firstLetter: (NSInteger) section
{
    return [[self.alphaString substringFromIndex:section] substringToIndex:1];
}

- (NSString *)categoryNameAtIndexPath: (NSIndexPath *)path
{
    NSArray *currentItems = self.allSectionData[path.section];
    NSString *category = currentItems[path.row];
    category = [category substringFromIndex:1];
    return category;
}

@end
