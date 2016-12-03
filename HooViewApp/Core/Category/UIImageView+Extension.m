//
//  UIImageView+Extension.m
//  ReYinApp
//
//  Created by Benjamin on 11/4/2015.
//  Copyright © 2015 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import "UIImageView+Extension.h"
//#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+YYWebImage.h"

@implementation UIImageView (Extension)

- (void) requestImageDataURL:(NSURL *) url withPlaceholder:(ImgPlaceholderType) placeholder {
    [self setupImg:url WithPlaceholder:placeholder];
}
- (void) requestImageDataURL:(NSURL *) url withPlaceholder:(ImgPlaceholderType) placeholder completion:(ImageCompletionBlock)completion {
    [self setupImg:url WithPlaceholder:placeholder completion:completion];
}

- (void) requestImageDataURLString:(NSString *) urlString withPlaceholder:(ImgPlaceholderType) placeholder {
//    if (urlString == nil) {
//        return;
//    }
    NSURL *url = [NSURL URLWithString:urlString];
//    if (url == nil) {
//        return;
//    }
    [self setupImg:url WithPlaceholder:placeholder];
}

- (void) requestImageDataURLString:(NSString *) urlString withPlaceholder:(ImgPlaceholderType) placeholder completion:(ImageCompletionBlock)completion {
    if (urlString == nil) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    if (url == nil) {
        return;
    }
    [self setupImg:url WithPlaceholder:placeholder completion:completion];
}

- (void) setupImg:(NSURL *) url WithPlaceholder:(ImgPlaceholderType) placeholder completion:(ImageCompletionBlock)completion {
    [self yy_setImageWithURL:url
                 placeholder:[self getPlaceholderImg:placeholder]
                     options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation | YYWebImageOptionShowNetworkActivity | YYWebImageOptionProgressive
                  completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                      if (error != nil) {
                          completion(NO, image, url, error);
                      }
                      else {
                          completion(YES, image, url, error);
                      }
                  }];
}

- (void) setupImg:(NSURL *) url WithPlaceholder:(ImgPlaceholderType) placeholder {
    [self yy_setImageWithURL:url
                 placeholder:[self getPlaceholderImg:placeholder]
                     options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation | YYWebImageOptionShowNetworkActivity | YYWebImageOptionProgressive
                  completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                  }];
}

- (UIImage *) getPlaceholderImg:(ImgPlaceholderType) placeholder {
    UIImage *placeholderImg = nil;
    if (placeholder == PlaceholderImgBigSquare) {
        placeholderImg = [UIImage imageNamed:@"placeholder_big_square"];
    }
    else if (placeholder == PlaceholderImgMidLogoSquare) {
        placeholderImg = [UIImage imageNamed:@"placeholder_mid_square"];
    }
    else if (placeholder == PlaceholderImgSmallGrayLogoSquare) {
        placeholderImg = [UIImage imageNamed:@"placeholder_gray_square"];
    }
    else if (placeholder == PlaceholderImgBigRectangle) {
        placeholderImg = [UIImage imageNamed:@"placeholder_big_rectangle"];
    }
    else if (placeholder == PlaceholderImgLickLogoRectangle) {
        placeholderImg = [UIImage imageNamed:@"placeholder_lick_logo_rectangle"];
    }
    else if (placeholder == PlaceholderImgGrayConcertPoster) {
        placeholderImg = [UIImage imageNamed:@"placeholder_gray_poster"];
    } else { //PlaceholderImgNone
        placeholderImg = [[UIImage alloc] init];
    }
    return placeholderImg;
}

@end
