//
//  CoreQueue.h
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct CoreQueueItem{
	id __unsafe_unretained value;
	struct CoreQueueItem *prevItem;
	struct CoreQueueItem *nextItem;
} CoreQueueItem;


@interface CoreQueue : NSObject {
    CoreQueueItem   *m_firstItem;
	CoreQueueItem   *m_lastItem;
	NSInteger       m_count;
}

@property (nonatomic, readonly) NSInteger count;

+ (id)queueFromQueue:(CoreQueue *)queue;

- (void)enqueueToFront:(id)value;
- (void)enqueueToTail:(id)value;
- (void)dequeueFromFront;
- (void)dequeueFromTail;
- (void)removeAllItems;
- (id)front;
- (id)tail;

@end
