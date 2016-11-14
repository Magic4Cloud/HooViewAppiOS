//
//  CoreQueue.m
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import "CoreQueue.h"

@interface CoreQueue ()

@end


@implementation CoreQueue

+ (id)queueFromQueue:(CoreQueue *)queue{
	CoreQueue *newQueue = [[CoreQueue alloc] init];
	
	if( [queue count] > 0 ){
		CoreQueueItem *item = queue->m_firstItem;
        
		while (item) {
			[newQueue enqueueToTail:item->value];
			item = item->nextItem;
		}
	}
	return newQueue;
}

- (id)init {
	if( self = [super init] ){
		m_firstItem = nil;
		m_lastItem = nil;
		m_count = 0;
	}
	return self;
}

- (void)enqueueToFront:(id)value {
	CoreQueueItem *newItem = (CoreQueueItem *)malloc(sizeof(CoreQueueItem));
	newItem->prevItem = nil;
	newItem->nextItem = nil;
	newItem->value = value;
	
	if( m_count == 0 ){
		m_firstItem = m_lastItem = newItem;
	} else {
		newItem->nextItem = m_firstItem;
		m_firstItem->prevItem = newItem;
		m_firstItem = newItem;
	}
	
	m_count++;
}

- (void)enqueueToTail:(id)value {
	CoreQueueItem *newItem = (CoreQueueItem *)malloc(sizeof(CoreQueueItem));
	newItem->prevItem = nil;
	newItem->nextItem = nil;
	newItem->value = value;
	
	if( m_count == 0 ){
		m_firstItem = m_lastItem = newItem;
	} else {
		newItem->prevItem = m_lastItem;
		m_lastItem->nextItem = newItem;
		m_lastItem = newItem;
	}
	m_count++;
}

- (void)dequeueFromFront {
	if( m_count > 0 ){
		CoreQueueItem *oldFirst = m_firstItem;
		
		m_firstItem = m_firstItem->nextItem;
		if( m_firstItem ){
			m_firstItem->prevItem = nil;
		}
		m_count--;
		
		free(oldFirst);
	}
}

- (void)dequeueFromTail {
	if( m_count > 0 ){
		CoreQueueItem *oldLast = m_lastItem;
		
		m_lastItem = m_lastItem->prevItem;
		if( m_lastItem ){
			m_lastItem->nextItem = nil;
		}
		m_count--;
		
		free(oldLast);
	}
}

- (void)removeAllItems {
	while (m_count > 0) {
		[self dequeueFromTail];
	}
}

- (id)front {
	return m_firstItem->value;
}

- (id)tail {
	return m_lastItem->value;
}

- (void)dealloc {
	[self removeAllItems];
}

@end
