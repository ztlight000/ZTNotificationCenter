//
//  ZTNotification.h
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/****************    Notifications    ****************/

@class NSString, NSDictionary, NSOperationQueue;

@interface ZTNotification : NSObject

@property (readonly, copy) NSString *name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;

- (instancetype)initWithName:(NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo NS_AVAILABLE(10_6, 4_0) ;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder ;

+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject;
+ (instancetype)notificationWithName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

@end

NS_ASSUME_NONNULL_END


