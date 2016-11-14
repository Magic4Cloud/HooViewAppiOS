//
//  UIImageView+Extension.h
//  ReYinApp
//
//  Created by Benjamin on 11/4/2015.
//  Copyright © 2015 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImgPlaceholderType) {
    PlaceholderImgBigSquare = 0,
    PlaceholderImgMidLogoSquare = 1,
    PlaceholderImgSmallGrayLogoSquare = 2,
    PlaceholderImgBigRectangle = 3,
    PlaceholderImgLickLogoRectangle = 4,
    PlaceholderImgGrayConcertPoster = 5,
    PlaceholderImgNone = 6
};

typedef void (^ImageCompletionBlock)(BOOL loadFinish, UIImage *image, NSURL *url, NSError *error);


@interface UIImageView (Extension)

- (void) requestImageDataURL:(NSURL *) url withPlaceholder:(ImgPlaceholderType) placeholder;
- (void) requestImageDataURL:(NSURL *) url withPlaceholder:(ImgPlaceholderType) placeholder completion:(ImageCompletionBlock)completion;

- (void) requestImageDataURLString:(NSString *) urlString withPlaceholder:(ImgPlaceholderType) placeholder;
- (void) requestImageDataURLString:(NSString *) urlString withPlaceholder:(ImgPlaceholderType) placeholder completion:(ImageCompletionBlock)completion;

@end
