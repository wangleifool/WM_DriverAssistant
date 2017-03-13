//
//  CityModel.m
//  Navagation
//
//  Created by 梅毅 on 16/8/17.
//  Copyright © 2016年 my. All rights reserved.
//

#import "StateModel.h"
#import "CitiesModel.h"

@implementation StateModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if ([super init])
    {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:self.cities.count];
        for (NSDictionary *dict in self.cities)
        {
            CitiesModel *model = [CitiesModel cityWithDict:dict];
            [models addObject:model];
        }
        _cities = models;
    }
    
    return self;
}
+(instancetype)stateWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
