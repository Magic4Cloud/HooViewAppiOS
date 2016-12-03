//
// Created by Steven Zhang @ Active Network on 3/12/13.
//


#import "NSString+Time.h"


@implementation NSString (Time)
+ (NSString *)stringWithTimeInterval:(NSTimeInterval)time {
    NSString *timeText = @"";

    NSUInteger totalMinutes = (NSUInteger) (time / 60);

    NSUInteger hours = totalMinutes / 60;
    NSUInteger minutes = totalMinutes % 60;

    if (hours == 1) {
        timeText = [timeText stringByAppendingFormat:@"%lu hour", (unsigned long)hours];
    } else if (hours > 1) {
        timeText = [timeText stringByAppendingFormat:@"%lu hours", (unsigned long)hours];
    }

    if (minutes > 0) {
        if (hours > 0) {
            timeText = [timeText stringByAppendingFormat:@", "];
        }

        if (minutes == 1) {
            timeText = [timeText stringByAppendingFormat:@"%lu minute", (unsigned long)minutes];
        } else {
            timeText = [timeText stringByAppendingFormat:@"%lu minutes", (unsigned long)minutes];
        }
    }

    return timeText;
}

@end