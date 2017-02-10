//
//  WMModelOfUserComment.h
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/9.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMModelOfUserComment : NSObject

@property (assign, nonatomic, readonly) NSInteger userID;
@property (strong, nonatomic, readonly) NSString *userName;
@property (strong, nonatomic, readonly) NSString *userIconUrl;
@property (strong, nonatomic, readonly) NSDate   *commentDate;
@property (strong, nonatomic, readonly) NSString *commentContent;
@property (assign, nonatomic, readonly) NSInteger numOfThumbUp;
@property (assign, nonatomic, readonly) WMModelOfUserComment *otherUserReply;

@end
