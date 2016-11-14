//
//  CoreUIViewController+Notification.h
//  ReYinApp
//
//  Created by Benjamin on 3/17/2016.
//  Copyright © 2016 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import "CoreUIViewController.h"

@interface CoreUIViewController (Notification)

//Notifications
- (void)showSuccessWithContent:(NSString *) content;
- (void)showSuccessWithContent:(NSString *) content isAlwaysDisplay:(BOOL) isDisplay beDismised:(BOOL) dismiss;

- (void)showInfoWithContent:(NSString *) content;
- (void)showWarningWithContent:(NSString *) content;
- (void)showErrorWithContent:(NSString *) content;

@end
