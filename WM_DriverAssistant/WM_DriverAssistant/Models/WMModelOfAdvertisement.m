//
//  WMModelOfAdvertisement.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/18.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMModelOfAdvertisement.h"

@implementation WMModelOfAdvertisement

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.adTransitionUrl = dic[@"transitionURL"];
        self.imgUrl          = dic[@"imageURL"];
    }
    
    return self;
}

+ (instancetype)modelOfAdvertisementWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}

+ (NSMutableArray *)advertisementOnPage:(NSInteger)pageIndex
{
    NSMutableArray *advertisements = [NSMutableArray array];
    
    NSArray *rootArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dataOfAdvertisement.plist" ofType:nil]];
    NSArray *pageAdArray = [rootArray objectAtIndex:pageIndex];
    for (NSDictionary *dic in pageAdArray) {
        [advertisements addObject:[self modelOfAdvertisementWithDictionary:dic]];
    }
    
    return advertisements;
}

@end
