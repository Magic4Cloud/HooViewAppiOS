//
//  UIScrollView+Extension.h
//  MobileApp
//
//  Created by Benjamin on 10/10/13.
//  Copyright (c) 2013 ActiveNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)

- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification;
- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification offset:(CGPoint)offset;

/// Returns true if the content has been scrolled all the way to the top (by pulling the content up).
- (BOOL)isScrolledToTop;

/// Returns true if the content has been scrolled all the way to the bottom (by pulling the content down).
- (BOOL)isScrolledToBottom;

/**
 Scroll content to top with animation.
 */
- (void)scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)scrollToRight;

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)scrollToRightAnimated:(BOOL)animated;



@end
