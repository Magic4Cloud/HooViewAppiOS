//
//  CoreUILabel.h
//  HotMusic
//
//  Created by Benjamin on 5/12/2015.
//  Copyright (c) 2015 ReYin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TextVerticalAlignment) {
    TextVerticalAlignmentCenter,
    TextVerticalAlignmentTop,
    TextVerticalAlignmentBottom
};

@interface CoreUILabel : UILabel

@property(nonatomic, assign) TextVerticalAlignment textVerticalAlignment;

- (CGSize)sizeOfMultiLineLabel;

+ (CGSize)estimateSizeOfMultiLineLabelWithContent:(NSString *) content AndFontSie:(UIFont *) font AndWidth:(CGFloat) width;

@end
