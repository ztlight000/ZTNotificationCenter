//
//  LinkListC.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/10/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LinkListC.h"

@implementation LinkListC

//单链表的初始化


LinkList LinkedListInit() {
    Node *L;
    L = (Node *)malloc(sizeof(Node));   //申请结点空间
    if(L == NULL) { //判断是否有足够的内存空间
        printf("申请内存空间失败\n");
    }
    L->next = NULL;                  //将next设置为NULL,初始长度为0的单链表
    return L;
}

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    
    if (self) {
        
        LinkedListInit();
        
    }
    
    return self;
    
}

+ (LinkList)listInit {
    
    LinkList list = LinkedListInit();
    
    return list;

}

+ (LinkList)insert:(id)data linkList:(LinkList)linkList {

    Node *head;
    
    head = linkList;

    Node *p;
    
    //插入的结点为p
    p = (Node *)malloc(sizeof(Node));
    
    p->data = (__bridge_retained void *)data;
    
    p->next = head->next;
    
    head->next= p;
    
    return linkList;
    
}


@end



