//
//  Numberchecker.m
//  BuWeA4
//
//  Created by Georg Zänker on 04.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Numberchecker.h"

@implementation Numberchecker

+(BOOL)isSquare:(int64)x
{
    int32 tst = (int32)sqrt(x);
    return tst*tst == x;
}
+(BOOL)isCubic:(int64)x
{
    int32 tst = (int32)cbrt(x);
    return tst*tst*tst == x;
}
+(BOOL)isPower4:(int64)x
{
    int16 tst = (int16)sqrt(sqrt(x));
    return tst*tst*tst*tst == x;
}

#pragma mark
+(BOOL)isNumber:(NSNumber*)number forMode:(Mode)currentMode
{
    switch (currentMode) {
        case Power2:
            return [self isSquare:[number unsignedLongLongValue]];
        case Power3:
            return [self isCubic:[number unsignedLongLongValue]];
        case Power4:
            return [self isPower4:[number unsignedLongLongValue]];
        default:
            return false;
            break;
    }
}

@end
