//
//  CoreCache.h
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreCache : NSObject

+ (CoreCache *)sharedCache;
+ (CoreCache *)sharedCacheForGroup:(NSString *)group;

- (id)initWithGroup:(NSString *)group;

//Data
- (id)dataForKey:(NSString *)key;
- (void)setData:(id)data forKey:(NSString *)key;

@end
