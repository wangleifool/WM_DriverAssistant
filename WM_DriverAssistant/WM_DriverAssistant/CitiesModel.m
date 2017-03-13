//
//  CitiesModel.m
//  Navagation
//
//  Created by 梅毅 on 16/8/17.
//  Copyright © 2016年 my. All rights reserved.
//

#import "CitiesModel.h"

@implementation CitiesModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)cityWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
