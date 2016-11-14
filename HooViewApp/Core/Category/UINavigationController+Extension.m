//
//  UINavigationController+Extension.m
//  HotMusic
//
//  Created by Benjamin on 7/17/14.
//  Copyright (c) 2014 ReYin All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)

- (UIViewController *)rootViewController {
    UIViewController *viewController = nil;
    
    NSArray *viewControllers = self.viewControllers;
    
    if ([viewControllers count] > 0) {
        viewController = [viewControllers objectAtIndex:0];
    }
    
    return viewController;
}

- (void)setRootViewController:(UIViewController *)viewController {
    [self setRootViewController:viewController animated:NO];
}
- (void)setRootViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSArray *viewControllers = [NSArray arrayWithObject:viewController];
    
    [self setViewControllers:viewControllers animated:animated];
}

@end
