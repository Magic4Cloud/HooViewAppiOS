//
//  NSTimer+Extension.m
//  ReYinApp
//
//  Created by Benjamin on 12/23/2015.
//  Copyright © 2015 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import "NSTimer+Extension.h"

@implementation NSTimer (Extension)

- (void)pauseTimer
{
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer
{
    [self setFireDate:[NSDate date]];
}

@end
