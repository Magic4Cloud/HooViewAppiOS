//
//  UIView+Extension.h
//  GTODashboard
//
//  Created by Benjamin on 6/4/13.
//  Copyright (c) 2013 ActiveMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////----UIView (Extension)----////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
@interface UIView (Extension)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat sizeW;
@property (nonatomic, assign) CGFloat sizeH;

- (UIImage *)screenshot;

- (void)removeAllSubviews;

- (void)setRoundingCornersDirection:(UIRectCorner) cornersDirection cornerRadius:(CGFloat) radius;
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size strokeColor:(UIColor *) color;

- (void)stackSubviews;

- (UIView *)findViewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse;

- (void)AutoLayoutTrace;

- (UIView *)findFirstResponder;

@end

