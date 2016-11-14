//
//  UINavigationBar+Translation.m
//  HotMusic
//
//  Created by Benjamin on 6/11/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import "UINavigationBar+Extension.h"
#import <objc/runtime.h>

//@implementation UINavigationBar (Translation)
//
//static char overlayKey;
//static char emptyImageKey;
//
//- (void)translation_setBackgroundColor:(UIColor *)backgroundColor
//{
//    if (!self.overlay) {
//        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
//        self.overlay.userInteractionEnabled = NO;
//        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//        [self insertSubview:self.overlay atIndex:0];
//    }
//    self.overlay.backgroundColor = backgroundColor;
//}
//
////- (void)translation_setContentAlpha:(CGFloat)alpha
////{
////    if (!self.overlay) {
////        [self translation_setBackgroundColor:self.barTintColor];
////    }
////    [self setAlpha:alpha forSubviewsOfView:self];
////    if (alpha == 1) {
////        if (!self.emptyImage) {
////            self.emptyImage = [UIImage new];
////        }
////        self.backIndicatorImage = self.emptyImage;
////    }
////}
////
////- (void)translation_setTranslationY:(CGFloat)translationY
////{
////    self.transform = CGAffineTransformMakeTranslation(0, translationY);
////}
////
////- (void)translation_reset
////{
////    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
////    [self setShadowImage:nil];
////    
////    [self.overlay removeFromSuperview];
////    self.overlay = nil;
////}
//
//
//
//- (void)setAlpha:(CGFloat)alpha forSubviewsOfView:(UIView *)view
//{
//    for (UIView *subview in view.subviews) {
//        if (subview == self.overlay) {
//            continue;
//        }
//        subview.alpha = alpha;
//        [self setAlpha:alpha forSubviewsOfView:subview];
//    }
//}
//
//
//- (UIView *)overlay
//{
//    return objc_getAssociatedObject(self, &overlayKey);
//}
//
//- (void)setOverlay:(UIView *)overlay
//{
//    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIImage *)emptyImage
//{
//    return objc_getAssociatedObject(self, &emptyImageKey);
//}
//
//- (void)setEmptyImage:(UIImage *)image
//{
//    objc_setAssociatedObject(self, &emptyImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//@end


@implementation UINavigationBar (BackgroundColor)
//static char overlayKey;
//
//- (UIView *)overlay
//{
//    return objc_getAssociatedObject(self, &overlayKey);
//}
//
//- (void)setOverlay:(UIView *)overlay
//{
//    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
//{
//    if (!self.overlay) {
//        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
//        self.overlay.userInteractionEnabled = NO;
//        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//        //[self insertSubview:self.overlay atIndex:0];
//    }
//    
//    for (UIView *view in self.subviews) {
//        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
//            //[view insertSubview:self.overlay atIndex:0];
//            view.backgroundColor = backgroundColor;
//        }
//    }
//    
//    self.overlay.backgroundColor = backgroundColor;
//}
//
//- (void)lt_setTranslationY:(CGFloat)translationY
//{
//    self.transform = CGAffineTransformMakeTranslation(0, translationY);
//}
//
//- (void)lt_setElementsAlpha:(CGFloat)alpha
//{
//    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
//        view.alpha = alpha;
//    }];
//    
//    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
//        view.alpha = alpha;
//    }];
//    
//    UIView *titleView = [self valueForKey:@"_titleView"];
//    titleView.alpha = alpha;
//    //    when viewController first load, the titleView maybe nil
//    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
//            obj.alpha = alpha;
//            *stop = YES;
//        }
//    }];
//}
//
//- (void)lt_reset
//{
//    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.overlay removeFromSuperview];
//    self.overlay = nil;
//}

- (void)RY_BackgroundColor:(UIColor *)backgroundColor {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            view.backgroundColor = backgroundColor;
        }
        if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            self.barTintColor = backgroundColor;
        }
    }
}

@end




@implementation UINavigationBar (HideBottomLine)


/**
 * Hide 1px hairline of the nav bar
 */
- (void)hideBottomHairline {
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = YES;
}

/**
 * Show 1px hairline of the nav bar
 */
- (void)showBottomHairline {
    // Show 1px hairline of translucent nav bar
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self];
    navBarHairlineImageView.hidden = NO;
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
