//
//  WMpageControllersInfo.m
//  WM_DriverAssistant
//
//  Created by 王雷 on 2016/10/28.
//  Copyright © 2016年 王雷. All rights reserved.
//

#import "WMpageControllersInfo.h"
#import <UIKit/UIKit.h>

@implementation WMpageControllersInfo



+ (WMpageControllersInfo *)pageInfoWithDictionary:(NSDictionary *)dic
{
    WMpageControllersInfo *pageInfo = [[WMpageControllersInfo alloc] init];
    
    pageInfo.className = [dic objectForKey:@"className"];
    pageInfo.title     = [dic objectForKey:@"title"];
    pageInfo.tabIcon   = [dic objectForKey:@"tabIcon"];
    pageInfo.selectedTabIcon = [dic objectForKey:@"selectedTabIcon"];
    
    return pageInfo;
}


+ (NSArray *)pageControllers
{
    UIViewController *viewController = nil;
    UINavigationController *navController = nil;
    NSMutableArray *arrayOfPageControllers = [NSMutableArray array];
    
    //获取plist文件的数据内容装入数组
    NSString *fileOfTabbarPagesPlist = [[NSBundle mainBundle] pathForResource:@"TabbarPages" ofType:@"plist"];
    NSArray *arrayOfPagesPlist = [NSArray arrayWithContentsOfFile:fileOfTabbarPagesPlist];
    
    //将数据转换成WMpageControllersInfo模块对象
    for (NSDictionary *dic in arrayOfPagesPlist) {
        WMpageControllersInfo *pageInfo = [WMpageControllersInfo pageInfoWithDictionary:dic];
        
        viewController = [[NSClassFromString(pageInfo.className) alloc] init];
        viewController.title = pageInfo.title;  //注意，单独设置导航栏的标题，可用viewController.navigationItem.title 来专门设置
        viewController.tabBarItem.image = [UIImage imageNamed:pageInfo.tabIcon];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:pageInfo.selectedTabIcon];
        
        navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [arrayOfPageControllers addObject:navController];
    }
    
    return arrayOfPageControllers;
}

@end
