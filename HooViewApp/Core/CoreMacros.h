//
//  CoreMacros.h
//  HotMusic
//
//  Created by Raymond Jiang on 6/26/14.
//  Copyright (c) 2014 ReYin All rights reserved.
//

///////////////////////////////////////////////////////////////////////////////////////////////////
// sRGB
#define CORE_RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.00f]
#define CORE_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// HSV
#define CORE_HSVCOLOR(h,s,v)    [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:1.00f]
#define CORE_HSVACOLOR(h,s,v,a) [UIColor colorWithHue:(h) saturation:(s) value:(v) alpha:(a)]

///////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////

#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])

///////////////////////////////////////////////////////////////////////////////////////////////////
//Nslog
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d  \t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif