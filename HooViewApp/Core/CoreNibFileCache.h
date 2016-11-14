//
//  CoreNibFileCacher.h
//  ReYinApp
//
//  Created by Benjamin on 11/5/2015.
//  Copyright © 2015 Shanghai REYIN Culture Development Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreNibFileCache : NSObject

+ (CoreNibFileCache *)sharedInstance;
- (UINib *)nibWithNameKey:(NSString *)nameKey;

@end
