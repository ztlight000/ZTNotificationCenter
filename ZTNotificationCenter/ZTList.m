//
//  ZTList.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZTList.h"
#import "ZTNotificationCenter.h"


@implementation ZTList

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    
    if (self) {
        
        self.head = [[ZTNode alloc] init];
        
        self.head.data = data;
        
        self.head.next = nil;
                
    }
    
    return self;
    
}

+ (id)listWithData:(id)data {
    
    ZTList *firstNode = [[ZTList alloc] initWithData:data];
    
    return firstNode;
    
}

+ (void)insert:(id)data linkList:(ZTList *)linkList {
    
    ZTNode *p = linkList.head;
    
    while (p.next) {
        
        p = p.next;
        
    }
    
    ZTNode *node = [[ZTNode alloc] init];
    
    node.data = data;
    
    node.next = p.next;
    
    p.next = node;
    
}


@end
