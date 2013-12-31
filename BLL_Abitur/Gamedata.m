//
//  Gamedata.m
//  BuWeA4
//
//  Created by Georg Zänker on 29.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Gamedata.h"

@implementation Gamedata

-(id)initDefault{
    self = [super init];
    if (self) {
        _usedSettings = [[Settings alloc]initDefault];
        _number = [NSString stringWithFormat:@""];
        _turn = 0;
        _lastSaved = nil;
        _name = nil;
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.usedSettings = [decoder decodeObjectForKey:    @"Settings"];
        self.number =       [decoder decodeObjectForKey:    @"Number"];
        self.turn =         [decoder decodeIntegerForKey:   @"Turn"];
        self.lastSaved =    [decoder decodeObjectForKey:    @"LastSaved"];
        self.name =         [decoder decodeObjectForKey:    @"Name"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_usedSettings forKey: @"Settings"];
    [encoder encodeObject:_number forKey:       @"Number"];
    [encoder encodeInteger:_turn forKey:        @"Turn"];
    [encoder encodeObject:_lastSaved forKey:    @"LastSaved"];
    [encoder encodeObject:_name forKey:         @"Name"];
}

#pragma mark
#pragma mark Laden/Speichern

+ (Gamedata *)loadGamedataWithKey:(NSString *)key {
    NSUserDefaults *defaults  = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list = [[defaults objectForKey:@"ListOfGames"]mutableCopy];
    NSData *encodedData       = [list objectForKey:key];
    Gamedata *data            = (Gamedata *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedData];
    
    return data;
}
+ (void)saveGamedata:(Gamedata *)data forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list     = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
    NSData *encodedData      = [NSKeyedArchiver archivedDataWithRootObject:data];
    [list setObject:encodedData forKey:key];
    [defaults setObject:list forKey:@"ListOfGames"];
    
    [defaults setObject:encodedData forKey:key];
    [defaults synchronize];
}
+ (void)deleteGamedataforKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
    [list removeObjectForKey:key];
    [defaults setObject:list forKey:@"ListOfGames"];
    [defaults synchronize];
}
@end
