//
//  ZTNode.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZTNode.h"

@implementation ZTNode

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.data = 0;
        
        self.next = nil;
        
    }
    
    return self;
    
}

- (id)initWithData:(id)data {
    
    self = [super init];
    
    if (self) {
        
        self.data = data;
        
        self.next = nil;
        
    }
    
    return self;
    
}

@end
