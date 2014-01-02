//
//  Highscore.h
//  BuWeA4
//
//  Created by Georg Zänker on 16.12.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomNSObject.h"

@interface Highscore : CustomNSObject

@property(nonatomic) NSArray *Power2;
@property(nonatomic) NSArray *Power3;
@property(nonatomic) NSArray *Power4;

-(id)initDefault;

@end
