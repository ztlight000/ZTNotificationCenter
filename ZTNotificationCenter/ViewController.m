//
//  ViewController.m
//  ZTNotificationCenter
//
//  Created by 张涛 on 2017/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"第一";

    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 120, 44)];
    
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    nextBtn.backgroundColor = [UIColor redColor];
    
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [nextBtn setTitle:@"前往第二个" forState:UIControlStateNormal];
    
    [self.view addSubview:nextBtn];
    
}

- (void)nextBtnClick {
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

@end











