//
//  NSNumber+Numberchecker.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import "NSNumber+Numberchecker.h"

@implementation NSNumber (Numberchecker)

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
+(BOOL)isNumber:(int64)number forMode:(Mode)currentMode
{
    switch (currentMode) {
        case Power2:
            return [self isSquare:number];
        case Power3:
            return [self isCubic:number];
        case Power4:
            return [self isPower4:number];
        default:
            return false;
            break;
    }
}

@end
