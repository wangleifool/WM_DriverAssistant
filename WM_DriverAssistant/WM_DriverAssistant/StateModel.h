//
//  CityModel.h
//  Navagation
//
//  Created by 梅毅 on 16/8/17.
//  Copyright © 2016年 my. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateModel : NSObject

@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) NSArray  *cities;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)stateWithDict:(NSDictionary *)dict;

@end
