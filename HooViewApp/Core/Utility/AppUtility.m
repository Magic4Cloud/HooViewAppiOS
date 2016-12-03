//
//  AppUtility.m
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import "AppUtility.h"

@implementation AppUtility

+ (NSString *)appVersion {
#ifdef DEBUG
    //Debug
    NSString *result = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]; //Build Number
#else
    //Release
    NSString *result = [NSString stringWithFormat:@"%@ - %@",
                        [AppUtility verisonNumber],
                        [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]]; //Version Number + Build Number
#endif
    return result;
}

+ (NSString *)verisonNumber {
    return [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)buildingNumber {
    return [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"];
}

@end
