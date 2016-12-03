//
//  NSArray+Extension.h
//  BaseCodeMobileApp
//
//  Created by Benjamin on 11/19/13.
//  Copyright (c) 2013 ReYin All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

- (NSString *) stringWithEnum: (NSUInteger) enumVal;
- (NSUInteger) enumFromString: (NSString *) strVal default: (NSUInteger) def;
- (NSUInteger) enumFromString: (NSString *) strVal;

- (id)randomObject;

@end
