//
//  UIToolbar+Extension.h
//  MobileApp
//
//  Created by Benjamin on 10/10/13.
//  Copyright (c) 2013 ActiveNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (Extension)

- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification;
- (void)adjustFrameWhenKeyboardWillHideNotification:(NSNotification *)notification;

@end
