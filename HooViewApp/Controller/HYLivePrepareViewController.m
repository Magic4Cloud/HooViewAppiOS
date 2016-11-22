//
//  HYLivePrepareViewController.m
//  HooViewApp
//
//  Created by Ananwu on 2016/11/17.
//  Copyright © 2016年 Ananwu. All rights reserved.
//

#import "HYLivePrepareViewController.h"

@interface HYLivePrepareViewController ()

@end

@implementation HYLivePrepareViewController

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark --- memory && initialization

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    
}

#pragma mark --- lif cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
