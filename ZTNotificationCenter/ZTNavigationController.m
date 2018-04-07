//
//  ZTNavigationController.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZTNavigationController.h"
#import "ZTNotificationCenter.h"

@interface ZTNavigationController ()

@end

@implementation ZTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    UIViewController *lastVC = self.viewControllers.lastObject;
    
//    [[ZTNotificationCenter defaultCenter] removeObserver:lastVC];
    
    return [super popViewControllerAnimated:animated];
    
}

@end
