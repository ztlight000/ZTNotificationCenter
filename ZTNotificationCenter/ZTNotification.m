//
//  ZTNotification.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZTNotification.h"

@implementation ZTNotification

- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    
    if (self = [super init]) {
        
        _name = name;
        
        _object = object;
        
        _userInfo = userInfo;
        
    }
    
    return self;
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    return nil;
    
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    
    return [[self alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject {
    
    return [self notificationWithName:aName object:anObject userInfo:nil];
    
}


@end
