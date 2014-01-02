//
//  Settings.m
//  BuWeA4
//
//  Created by Georg Zänker on 04.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Settings.h"

@implementation Settings

-(id)initDefault
{
    self = [super init];
    if (self) {
        
        self.difficulty = 0;
        self.mode = 0;
        self.perspective = 0;
        self.saveOn = NO;
        self.automaticSaveOn = NO;
        
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.difficulty = [decoder decodeIntegerForKey:  @"Difficulty"];
        self.mode = [decoder decodeIntegerForKey:        @"Mode"];
        self.perspective = [decoder decodeIntegerForKey: @"Perspective"];
        self.saveOn = [decoder decodeBoolForKey:                @"SaveOn"];
        self.automaticSaveOn = [decoder decodeBoolForKey:       @"AutomaticSaveOn"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInteger: _difficulty forKey:     @"Difficulty"];
    [encoder encodeInteger: _mode forKey:           @"Mode"];
    [encoder encodeInteger: _perspective forKey:    @"Perspective"];
    [encoder encodeBool: _saveOn forKey:                   @"SaveOn"];
    [encoder encodeBool: _automaticSaveOn forKey:          @"AutomaticSaveOn"];
}

@end
