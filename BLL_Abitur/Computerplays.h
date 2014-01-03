//
//  Computerplays.h
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomNSObject.h"
#import "Settings.h"

typedef enum {VorneP, HintenP} Position;

@interface Computerplays : CustomNSObject

+ (NSString*)playGameWithSettings:(Settings*)settings usingTheNumber:(NSString*)number;

@end
