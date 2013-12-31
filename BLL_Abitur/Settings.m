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
        
        self.currentDifficulty = 0;
        self.currentMode = 0;
        self.currentPerspective = 0;
        self.saveOn = NO;
        self.automaticSaveOn = NO;
        
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.currentDifficulty = [decoder decodeIntegerForKey:  @"Difficulty"];
        self.currentMode = [decoder decodeIntegerForKey:        @"Mode"];
        self.currentPerspective = [decoder decodeIntegerForKey: @"Perspective"];
        self.saveOn = [decoder decodeBoolForKey:                @"SaveOn"];
        self.automaticSaveOn = [decoder decodeBoolForKey:       @"AutomaticSaveOn"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInteger: _currentDifficulty forKey:     @"Difficulty"];
    [encoder encodeInteger: _currentMode forKey:           @"Mode"];
    [encoder encodeInteger: _currentPerspective forKey:    @"Perspective"];
    [encoder encodeBool: _saveOn forKey:                   @"SaveOn"];
    [encoder encodeBool: _automaticSaveOn forKey:          @"AutomaticSaveOn"];
}

@end
