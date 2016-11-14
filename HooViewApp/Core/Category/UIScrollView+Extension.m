//
//  UIScrollView+Extension.m
//  MobileApp
//
//  Created by Benjamin on 10/10/13.
//  Copyright (c) 2013 ActiveNetwork. All rights reserved.
//

#import "UIScrollView+Extension.h"

#define kParamDictUserInfoKey   @"kParamDictUserInfoKey"
#define kParamDictOffsetKey     @"kParamDictOffsetKey"

@implementation UIScrollView (Extension)

- (void)delayAdjustFrame:(NSDictionary *)paramDict {
    NSDictionary *userInfo = paramDict[kParamDictUserInfoKey];
    CGPoint offset = [paramDict[kParamDictOffsetKey] CGPointValue];
    
    UIViewAnimationCurve animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //CGRect keyboardBeginFrame = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    //keyboardBeginFrame = [keyWindow convertRect:keyboardBeginFrame toView:self.superview];
    keyboardEndFrame = [keyWindow convertRect:keyboardEndFrame toView:self.superview];
    
    CGRect viewFrame = self.frame;
    
    if (keyboardEndFrame.origin.y > viewFrame.origin.y) {
        CGFloat offsetY = viewFrame.origin.y + viewFrame.size.height - keyboardEndFrame.origin.y - offset.y;
        
        viewFrame.size.height -= offsetY;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:animationCurve];
        [UIView setAnimationDuration:animationDuration];
        
        self.frame = viewFrame;
        
        [UIView commitAnimations];
    }
}

- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification {
    [self adjustFrameWhenKeyboardWillShowNotification:notification offset:CGPointZero];
}

- (void)adjustFrameWhenKeyboardWillShowNotification:(NSNotification *)notification offset:(CGPoint)offset {
    NSDictionary *paramDict = @{kParamDictUserInfoKey: [notification userInfo],
                               kParamDictOffsetKey: [NSValue valueWithCGPoint:offset]};
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [self performSelector:@selector(delayAdjustFrame:) withObject:paramDict afterDelay:0.1f];
}

- (BOOL)isScrolledToTop {
    return (self.contentOffset.y <= [self verticalOffsetToTop]);
}

- (BOOL)isScrolledToBottom {
    return (self.contentOffset.y >= [self verticalOffsetToBottom]);
}

- (CGFloat)verticalOffsetToTop {
    CGFloat verticalOffsetTop = self.contentInset.top;
    return -verticalOffsetTop;
}

- (CGFloat)verticalOffsetToBottom {
    CGFloat verticalOffsetBottom = (self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
    return verticalOffsetBottom;
}


- (void)scrollToTop {
    [self scrollToTopAnimated:YES];
}

- (void)scrollToBottom {
    [self scrollToBottomAnimated:YES];
}

- (void)scrollToLeft {
    [self scrollToLeftAnimated:YES];
}

- (void)scrollToRight {
    [self scrollToRightAnimated:YES];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
