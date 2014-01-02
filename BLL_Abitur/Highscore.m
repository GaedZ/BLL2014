//
//  Highscore.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 16.12.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Highscore.h"

@implementation Highscore

-(id)initDefault {
    self = [super init];
    if (self) {
        NSNumber *easy = [[NSNumber alloc] initWithInt:0];
        NSNumber *intermediate = [[NSNumber alloc] initWithInt:0];
        NSNumber *hard = [[NSNumber alloc] initWithInt:0];
        NSArray *difficulty = [[NSArray alloc] initWithObjects:easy,intermediate,hard, nil];
        
        self.Power2 = [NSArray arrayWithArray:difficulty];
        self.Power3 = [NSArray arrayWithArray:difficulty];
        self.Power4 = [NSArray arrayWithArray:difficulty];
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.Power2 = [decoder decodeObjectForKey: @"Power2"];
        self.Power3 = [decoder decodeObjectForKey: @"Power3"];
        self.Power4 = [decoder decodeObjectForKey: @"Power4"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.Power2 forKey: @"Power2"];
    [encoder encodeObject:self.Power3 forKey: @"Power3"];
    [encoder encodeObject:self.Power4 forKey: @"Power4"];
}

@end
