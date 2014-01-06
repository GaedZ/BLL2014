//
//  NSNumber+Numberchecker.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    PvP = 0,
    Easy,
    Medium,
    Hard
}Difficulty;

typedef unsigned long long int int64;
typedef unsigned long int int32;
typedef unsigned short int16;

typedef enum{
    Power2 = 0,
    Power3,
    Power4
}Mode;

typedef enum {SCORER, WINNER} Perspective;

@interface NSNumber (Numberchecker)

+ (BOOL)isNumber:(int64)number forMode:(Mode)currentMode;

+ (BOOL)isSquare:(int64)x;
+ (BOOL)isCubic:(int64)x;
+ (BOOL)isPower4:(int64)x;


@end
