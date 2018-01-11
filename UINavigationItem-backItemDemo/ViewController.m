//
//  ViewController.m
//  UINavigationItem-backItemDemo
//
//  Created by 马遥 on 2018/1/11.
//  Copyright © 2018年 马遥. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)initialize {
//    CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
//    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
//    if (@available (iOS 11.0, *)) {
//        UIBarButtonItem *backBarButton = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
//        [backBarButton setBackButtonTitlePositionAdjustment:UIOffsetMake(-screenWidth, -0) forBarMetrics:UIBarMetricsDefault];
//    } else {
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-screenWidth, -screenHeight) forBarMetrics:UIBarMetricsDefault];
//    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"测试 AAAAAAAA";
}
- (IBAction)pushNextViewController:(id)sender {
    TestViewController *controller = [[TestViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
