//
//  ThirdViewController.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ThirdViewController.h"

#import "ZTNotification.h"
#import "ThirdViewController.h"
#import "ZTNotificationCenter.h"


@interface ThirdViewController ()

@property (nonatomic, weak) UITextField *textField;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setUpView];
    
}

- (void)setUpView {
    
    self.title = @"第三";
    
    self.view.backgroundColor = [UIColor grayColor];

    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(150, 100, 120, 44)];
    
    titleLbl.text = @"这是第三个控制器";
    
    [self.view addSubview:titleLbl];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(150, 150, 120, 44)];
    
    textField.text = @"哈哈哈哈哈";
    
    _textField = textField;
    
    [self.view addSubview:textField];
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 120, 44)];
    
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    backBtn.backgroundColor = [UIColor redColor];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];

    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:backBtn];
    
}

- (void)backBtnClick {
    
    //test1
//    NSNotification *notification = [NSNotification notificationWithName:@"TextFieldValueChanged" object:self.textField];
//
//    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
//
//    [notificationCenter postNotification:notification];
    
    
    //test2
    ZTNotification *notification = [ZTNotification notificationWithName:@"TextFieldValueChanged" object:self.textField];

    ZTNotificationCenter *notificationCenter = [ZTNotificationCenter defaultCenter];

    [notificationCenter postNotification:notification];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)dealloc {
        
    NSLog(@"第三个控制器释放");
    
}

@end






