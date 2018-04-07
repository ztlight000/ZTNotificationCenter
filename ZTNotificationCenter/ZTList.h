//
//  ZTList.h
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTNode.h"

@interface ZTList : NSObject

@property ZTNode *head;//定义链表的头

+ (void)insert:(id)data linkList:(ZTList *)linkList;//插入结点

+ (id)listWithData:(id)data;//工厂方法


@end
