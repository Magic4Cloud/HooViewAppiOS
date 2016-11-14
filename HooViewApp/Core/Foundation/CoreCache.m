//
//  CoreCache.m
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import "CoreCache.h"

@interface CoreCache()
#pragma mark – Private properties
@property (nonatomic, strong) NSString              *group;
@property (nonatomic, strong) NSMutableDictionary   *dictionary;
@end


@implementation CoreCache

static NSDictionary *coreCacheDictionary = nil;

#pragma mark - Singleton methods

+ (CoreCache *)sharedCache {
    return [self sharedCacheForGroup:@"_shared_cache_"];
}
+ (CoreCache *)sharedCacheForGroup:(NSString *)pGroup {
    if (coreCacheDictionary == nil) {
        @synchronized(self) {
            if (coreCacheDictionary == nil) {
                coreCacheDictionary = [[NSMutableDictionary alloc] init];
            }
        }
    }
    CoreCache *dataCache = coreCacheDictionary[pGroup];
    if (dataCache == nil) {
        @synchronized(self) {
            if (dataCache == nil) {
                dataCache = [[CoreCache alloc] initWithGroup:pGroup];
                [coreCacheDictionary setValue:dataCache forKey:pGroup];
            }
        }
    }
    return dataCache;
}

#pragma mark - Initialization

- (id)initWithGroup:(NSString *)group {
    if (self = [super init]) {
        _group = group;
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Public property & method

- (id)dataForKey:(NSString *)key {
    NSString *groupKey = [NSString stringWithFormat:@"%@%@", _group, key];
    id data = _dictionary[groupKey];
    return data == [NSNull null] ? nil : data;
}
- (void)setData:(id)data forKey:(NSString *)key {
    NSString *groupKey = [NSString stringWithFormat:@"%@%@", _group, key];
    if (data != nil) {
        _dictionary[groupKey] = data;
    } else {
        [_dictionary removeObjectForKey:groupKey];
    }
}

@end
