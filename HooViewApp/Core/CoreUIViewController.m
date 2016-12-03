//
//  CoreUIViewController.m
//  HotMusic
//
//  Created by Benjamin on 5/8/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import "CoreUIViewController.h"

#import "MessageNotificationManager.h"

@interface CoreUIViewController ()

@property (nonatomic, assign) BOOL initialized;

@end

@implementation CoreUIViewController

- (void)setup {
    
}

- (void)initialize {
    if( !self.initialized ){
        self.initialized = YES;
        [self setup];
    }
}

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
