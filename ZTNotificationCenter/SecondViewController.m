//
//  SecondViewController.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SecondViewController.h"

#import "ZTNotification.h"
#import "ThirdViewController.h"
#import "ZTNotificationCenter.h"


@interface SecondViewController ()

@property (nonatomic, weak) UILabel *titleLbl;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setUpView];
 
//    [self testWithNSNotification];

    [self testWithCrackNotification1];

}

- (void)setUpView {
    
    self.title = @"第二";

    self.view.backgroundColor = [UIColor orangeColor];

    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(150, 100, 120, 44)];
    
    titleLbl.text = @"这是第二个控制器";
    
    _titleLbl = titleLbl;
    
    [self.view addSubview:titleLbl];
    
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 120, 44)];
    
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    nextBtn.backgroundColor = [UIColor redColor];
    
    [nextBtn setTitle:@"前往第三个" forState:UIControlStateNormal];

    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:nextBtn];
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 120, 44)];
    
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    backBtn.backgroundColor = [UIColor redColor];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];

    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:backBtn];

}

- (void)testWithNSNotification {
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(test:) name:@"TextFieldValueChanged" object:nil];
 
}

- (void)testWithCrackNotification1 {
    
    ZTNotificationCenter *notificationCenter = [ZTNotificationCenter defaultCenter];

    [notificationCenter addObserver:self selector:@selector(test1:) name:@"TextFieldValueChanged" object:nil];
    
}

- (void)test:(NSNotification *)notification {
    
    if ([notification.name isEqualToString:@"TextFieldValueChanged"]) {
        
        UITextField *textField = notification.object;
        
        self.titleLbl.text = textField.text;
        
    }
    
}

- (void)test1:(ZTNotification *)notification {
    
    if ([notification.name isEqualToString:@"TextFieldValueChanged"]) {
        
        UITextField *textField = notification.object;
        
        self.titleLbl.text = textField.text;
        
    }
    
}

- (void)nextBtnClick {
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    
    [self.navigationController pushViewController:thirdVC animated:YES];
    
}

- (void)backBtnClick {
    
//    [[ZTNotificationCenter defaultCenter] removeObserver:self name:@"TextFieldValueChanged" object:nil];

    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)dealloc {
    
    [[ZTNotificationCenter defaultCenter] removeObserver:self name:@"TextFieldValueChanged" object:nil];
    
    NSLog(@"第二个控制器释放");
    
}


@end







