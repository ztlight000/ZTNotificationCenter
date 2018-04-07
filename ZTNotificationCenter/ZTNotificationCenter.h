//
//  ZTNotificationCenter.h
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZTNotification;

NS_ASSUME_NONNULL_BEGIN

@interface ZTNotificationCenter : NSObject

+ (ZTNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)postNotification:(ZTNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;

- (id <NSObject>)addObserverForName:(nullable NSString *)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(ZTNotification *note))block NS_AVAILABLE(10_6, 4_0);

@end

NS_ASSUME_NONNULL_END
