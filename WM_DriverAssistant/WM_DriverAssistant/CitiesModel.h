//
//  CitiesModel.h
//  Navagation
//
//  Created by 梅毅 on 16/8/17.
//  Copyright © 2016年 my. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitiesModel : NSObject

@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSArray  *areas;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cityWithDict:(NSDictionary *)dict;

@end
