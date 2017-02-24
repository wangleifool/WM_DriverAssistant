//
//  WMappDatabase.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMappDatabase.h"
#import "FMDatabase.h"
#import "WMmodelOfExamQuestion.h"

@implementation WMappDatabase

- (NSString *)databaseFilePath
{
    return [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
}

+ (NSArray *)getAllExamQuestion
{
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
    FMDatabase * db = [FMDatabase databaseWithPath:dbPath];
    if ([db open]) {
        NSString * sql = [NSString stringWithFormat:@"SELECT * from \"%@\";",tableAllQuestion];
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            WMmodelOfExamQuestion *model = [WMmodelOfExamQuestion examQuestionModelWithFMResultSet:rs];
            [questions addObject:model];
        }
        [db close];
    }
    
    return [questions copy];
}

@end
