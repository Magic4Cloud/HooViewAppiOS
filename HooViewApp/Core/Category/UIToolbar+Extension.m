//
//  UIToolbar+Extension.m
//  MobileApp
//
//  Created by Benjamin on 10/10/13.
//  Copyright (c) 2013 ActiveNetwork. All rights reserved.
//

#import "UIToolbar+Extension.h"

@implementation UIToolbar (Extension)

- (void)adjustFrameWhenKeyboardWillToggleNotification:(NSNotification *)notification willHide:(BOOL)willHide {
    NSDictionary *userInfo = [notification userInfo];
    
    UIViewAnimationCurve animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardBeginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    keyboardBeginFrame = [keyWindow convertRect:keyboardBeginFrame toView:self.superview];
    keyboardEndFrame = [keyWindow convertRect:keyboardEndFrame toView:self.superview];
    
    CGRect viewFrame = self.frame;
    BOOL needAdjustOriginY = keyboardBeginFrame.origin.y != keyboardEndFrame.origin.y;
    CGFloat toolbarBeginOriginY = keyboardBeginFrame.origin.y - viewFrame.size.height;
    CGFloat toolbarEndOriginY = keyboardEndFrame.origin.y - viewFrame.size.height;
    
    self.frame = CGRectMake(keyboardBeginFrame.origin.x, toolbarBeginOriginY, viewFrame.size.width, viewFrame.size.height);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    
    self.frame = CGRectMake(keyboardEndFrame.origin.x, toolbarEndOriginY, viewFrame.size.width, viewFrame.size.height);
    if (needAdjustOriginY) {
        self.alpha = willHide ? 0.0f : 1.0f;
    }
    
    [UIView commitAnimations];
}

- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification {
    [self adjustFrameWhenKeyboardWillToggleNotification:notification willHide:NO];
}

- (void)adjustFrameWhenKeyboardWillHideNotification:(NSNotification *)notification {
    [self adjustFrameWhenKeyboardWillToggleNotification:notification willHide:NO];
}

@end
