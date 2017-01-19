//
//  WMModelOfAdvertisement.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/1/18.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMModelOfAdvertisement : NSObject

@property (strong, nonatomic) NSString *imgUrl;
@property (strong, nonatomic) NSString *adTransitionUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)modelOfAdvertisementWithDictionary:(NSDictionary *)dic;
+ (NSMutableArray *)advertisementOnPage:(NSInteger)pageIndex;

@end
