//
//  Settings.h
//  BuWeA4
//
//  Created by Georg Zänker on 04.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomNSObject.h"


@interface Settings : CustomNSObject

@property(nonatomic,readwrite) Difficulty difficulty;
@property(nonatomic,readwrite) Mode mode;
@property(nonatomic,readwrite) Perspective perspective;
@property(nonatomic,readwrite) BOOL saveOn;
@property(nonatomic,readwrite) BOOL automaticSaveOn;

-(id)initDefault;

@end
