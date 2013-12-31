//
//  Numberchecker.h
//  BuWeA4
//
//  Created by Georg Zänker on 04.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"


@interface Numberchecker : NSObject

+ (BOOL)isSquare: (int64)x;
+ (BOOL)isCubic:  (int64)x;
+ (BOOL)isPower4: (int64)x;

+ (BOOL)isNumber:(NSNumber*)number forMode:(Mode)currentMode;

@end
