//
//  MessageNotificationManager.h
//  ReYinApp
//
//  Created by Benjamin on 3/16/2016.
//  Copyright © 2016 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MessageNotificationView.h"


@interface MessageNotificationManager : NSObject

+ (instancetype)sharedInstance;

+ (UIViewController *)defaultViewController;
+ (void)setDefaultViewController:(UIViewController *)defaultViewController;

+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType;
+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType durationType:(MessageNotificationDuration) durationType;
+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType durationType:(MessageNotificationDuration) durationType beDismised: (BOOL)dismissingEnabled;
+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType durationType:(MessageNotificationDuration) durationType beDismised: (BOOL)dismissingEnabled completeBlock:(void (^)())block;

//+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType beDismised: (BOOL)dismissingEnabled;
//+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType completeBlock:(void (^)())block;
//+ (void)showMessageWithConctent:(NSString *) content messageType:(MessageNotificationType) msgType beDismised: (BOOL)dismissingEnabled completeBlock:(void (^)())block;

+ (BOOL)dismissActiveNotification;
+ (BOOL)isNotificationActive;

@end
