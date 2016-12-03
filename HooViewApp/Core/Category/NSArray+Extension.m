//
//  NSArray+Extension.m
//  BaseCodeMobileApp
//
//  Created by Benjamin on 11/19/13.
//  Copyright (c) 2013 ReYin All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSString *) stringWithEnum: (NSUInteger) enumVal {
    return self[enumVal];
}

- (NSUInteger) enumFromString: (NSString*) strVal default: (NSUInteger) def {
    NSUInteger n = [self indexOfObject:strVal];
    if(n == NSNotFound) n = def;
    return n;
}

- (NSUInteger) enumFromString: (NSString*) strVal {
    return [self enumFromString:strVal default:0];
}

- (id)randomObject
{
    id randomObject = [self count] ? self[arc4random_uniform((u_int32_t)[self count])] : nil;
    return randomObject;
}

@end
