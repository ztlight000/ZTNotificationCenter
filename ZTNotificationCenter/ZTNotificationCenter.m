//
//  ZTNotificationCenter.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZTNotificationCenter.h"
#import "ZTNotification.h"
#import "ZTList.h"
#import "ZTNode.h"
#import "LinkListC.h"

/***************************ZTObserverModel*************************************/
typedef void(^OperationBlock)(ZTNotification *notification);

@interface ZTObserverModel : NSObject

@property (nonatomic, weak) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, copy) NSString *notificationName;
@property (nonatomic, weak) id object;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, copy) OperationBlock block;

@end

@implementation ZTObserverModel

@end
/***************************ZTObserverModel*************************************/


@interface ZTNotificationCenter ()

@property (nonatomic, strong) NSMutableArray *observers;

@property (nonatomic, strong) ZTList *ztList;

@property LinkList linkListC;


@end

@implementation ZTNotificationCenter

- (instancetype)init {
    
    @throw [NSException exceptionWithName:@"Cannot be involked" reason:@"Singleton" userInfo:nil];
    
}

+ (ZTNotificationCenter *)defaultCenter {
    
    static ZTNotificationCenter *singleton;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[self alloc] initSingleton];
        
    });
    
    return singleton;
    
}

- (instancetype)initSingleton {
    
    if ([super init]) {
        
//        _observers = [NSMutableArray array]; //数组初始化
        
        _linkListC = [LinkListC listInit]; //c链表初始化
        
//        _ztList = [ZTList listWithData:@"0"]; //oc链表初始化
        
    }
    
    return self;
    
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {
    
    ZTObserverModel *observerModel = [[ZTObserverModel alloc] init];
    
    observerModel.observer = observer;
    
    observerModel.selector = aSelector;
    
    observerModel.notificationName = aName;
    
    observerModel.object = anObject;
    
//    [self.observers addObject:observerModel]; //采用数组形式
    
//    [ZTList insert:observerModel linkList:_ztList]; //采用oc模拟链表
    
    [LinkListC insert:observerModel linkList:_linkListC]; //采用C链表
    
}

- (void)postNotification:(ZTNotification *)notification {
    
    //采用C链表
    Node *p;
    
    p = _linkListC;
    
    while (p->next) {
        
        p = p->next;
        
        ZTObserverModel *observerModel = (__bridge id)p->data;
        
        id observer = observerModel.observer;
        
        SEL selector = observerModel.selector;
        
        if (![notification.name isEqualToString:observerModel.notificationName]) {
            
            return;
            
        }
        
        if (!observerModel.operationQueue) {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop
            
        } else {
            
            
            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                
                observerModel.block(notification);
                
            }];
            
            NSOperationQueue *operationQueue = observerModel.operationQueue;
            
            [operationQueue addOperation:operation];
            
        }
    }
    
    /*
    //采用oc模拟链表
    ZTNode *p = _ztList.head;
    
    while (p) {
        
        p = p.next;
        
        ZTObserverModel *observerModel = p.data;
        
        id observer = observerModel.observer;
        
        SEL selector = observerModel.selector;
        
        if (![notification.name isEqualToString:observerModel.notificationName]) {
            
            return;
            
        }
        
        if (!observerModel.operationQueue) {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop
            
        } else {
            
            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                
                observerModel.block(notification);
                
            }];
            
            NSOperationQueue *operationQueue = observerModel.operationQueue;
            
            [operationQueue addOperation:operation];
            
        }

    }
    */
    
    /*//采用数组形式
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ZTObserverModel *observerModel = obj;
        
        id observer = observerModel.observer;
        
        SEL selector = observerModel.selector;
        
        if (![notification.name isEqualToString:observerModel.notificationName]) {
            
            return;
            
        }
        
        if (!observerModel.operationQueue) {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop
            
        } else {
            
            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                
                observerModel.block(notification);
                
            }];
            
            NSOperationQueue *operationQueue = observerModel.operationQueue;
            
            [operationQueue addOperation:operation];
            
        }
        
    }];
    */
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    
    [self postNotificationName:aName object:anObject userInfo:nil];
    
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    
    ZTNotification *notification = [[ZTNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    
    [self postNotification:notification];
    
}

- (void)removeObserver:(id)observer {
    
    [self removeObserver:observer name:nil object:nil];
    
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject {
    
    //oc链表删除
//    [self deleteLinkList:_ztList name:aName];
    
    //c链表删除
    [self deleteLinkListC:_linkListC name:aName];
    
    /*//数组形式删除
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ZTObserverModel *observerModel = obj;
        
        if (observerModel.observer == observer && aName == nil  && anObject == nil) {

            [self.observers removeObject:observerModel];
            
            *stop = YES;

        }
        
        if ([observerModel.notificationName isEqualToString:aName] && observerModel.object == anObject) {
            
            [self.observers removeObject:observerModel];
            
            *stop = YES;
            
        }
        
    }];
    */
}

- (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(ZTNotification * _Nonnull))block {
    
    ZTObserverModel *observerModel = [[ZTObserverModel alloc] init];
    
    observerModel.notificationName = name;
    
    observerModel.object = obj;
    
    observerModel.operationQueue = queue;
    
    observerModel.block = block;
    
    [self.observers addObject:observerModel];
    
    return nil;
    
}

- (void)deleteLinkList:(ZTList *)linkList name:(NSString *)aName {
    
    //oc模拟链表
    ZTNode *p = linkList.head;
    
    ZTNode *pre = linkList.head;
    
    while (p.next) {
        
        p = p.next;
        
        ZTObserverModel *model = (ZTObserverModel *)p.data;
        
        if (model.notificationName == aName) {
            
            pre.next = p.next;
            
        }
        
        pre = p.next;
        
    }

}

- (void)deleteLinkListC:(LinkList)linkList name:(NSString *)aName {
    
    //c链表
    Node *p, *nodePre;
    
    p = nodePre = linkList;
    
    while (p->next) {
        
        p = p->next;
        
        ZTObserverModel *model = (__bridge ZTObserverModel *)p->data;
        
        if (model.notificationName == aName) {
            
            nodePre->next = p->next;
            
        }
        
        nodePre = p->next;
        
    }
    
}
@end











