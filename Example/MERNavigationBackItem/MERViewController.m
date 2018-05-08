//
//  MERViewController.m
//  MERNavigationBackItem
//
//  Created by 马遥 on 05/08/2018.
//  Copyright (c) 2018 马遥. All rights reserved.
//

#import "MERViewController.h"
#import "MERTestViewController.h"

@interface MERViewController ()

@end

@implementation MERViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"测试 AAAAAAAA";
}

- (IBAction)pushToNextController:(id)sender {
    [self.navigationController pushViewController:[MERTestViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
