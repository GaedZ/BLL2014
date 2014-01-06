//
//  Computerplays.h
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

typedef enum {Vorne, Hinten} Position;

@interface Computerplays : NSObject

+ (NSString*)playGameWithSettings:(Settings*)settings usingTheNumber:(NSString*)number;

@end
