//
//  GamingInfo.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 02.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import "GamingInfo.h"

@implementation GamingInfo

-(id)initDefault
{
    self = [super init];
    if (self) {
        
        self.number = nil;
        self.turn = 0;
        self.lastSaved = nil;
        
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.number = [decoder          decodeObjectForKey:  @"Number"];
        self.turn = [decoder            decodeIntegerForKey: @"Turn"];
        self.lastSaved = [decoder       decodeObjectForKey: @"LastSaved"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: self.number      forKey: @"Number"];
    [encoder encodeInteger: self.turn       forKey: @"Turn"];
    [encoder encodeObject: self.lastSaved   forKey: @"LastSaved"];
}

@end
