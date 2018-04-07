//
//  LinkListC.h
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct Node {
    
    void *data;
    
    struct Node *next;
    
} Node;

typedef struct Node *LinkList;

@interface LinkListC : NSObject

+ (LinkList)insert:(id)data linkList:(LinkList)linkList;//插入结点

+ (LinkList)listInit;

@end
