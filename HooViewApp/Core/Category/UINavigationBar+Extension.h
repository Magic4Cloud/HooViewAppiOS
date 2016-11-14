//
//  UINavigationBar+Translation.h
//  HotMusic
//
//  Created by Benjamin on 6/11/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface UINavigationBar (Translation)
//
////- (void)translation_setBackgroundColor:(UIColor *)backgroundColor;
////- (void)translation_setContentAlpha:(CGFloat)alpha;
////- (void)translation_setTranslationY:(CGFloat)translationY;
////- (void)translation_reset;
//
//@end


@interface UINavigationBar (BackgroundColor)
- (void)RY_BackgroundColor:(UIColor *)backgroundColor;
@end


@interface UINavigationBar (HideBottomLine)

- (void)hideBottomHairline;
- (void)showBottomHairline;

@end
