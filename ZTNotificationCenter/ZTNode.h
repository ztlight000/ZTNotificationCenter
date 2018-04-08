//
//  ZTNode.h
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTNode : NSObject

@property id data; //数据域

@property ZTNode *next; //指针域，指向下个节点

- (id)initWithData:(id)data; //结点初始化

@end
