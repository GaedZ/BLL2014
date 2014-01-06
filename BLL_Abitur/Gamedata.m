//
//  Gamedata.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 29.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Gamedata.h"

@implementation Gamedata

-(id)initDefault {
    self = [super init];
    if (self) {
        self.gamingInfo = [[GamingInfo alloc] initDefault];
        self.settings = [[Settings alloc] initDefault];
        self.pointer = nil;
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.gamingInfo = [decoder decodeObjectForKey: @"GamingInfo"];
        self.settings = [decoder decodeObjectForKey: @"Settings"];
        self.pointer = [decoder decodeObjectForKey: @"Pointer"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.gamingInfo forKey:@"GamingInfo"];
    [encoder encodeObject:self.settings forKey: @"Settings"];
    [encoder encodeObject:self.pointer forKey: @"Pointer"];
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

- (void)saveDataforKey:(NSString *)key {
    self.pointer = key;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list     = [[defaults objectForKey:@"ListOfGames"] mutableCopy];

    NSData *encodedData      = [NSKeyedArchiver archivedDataWithRootObject:self];
    [list setObject:encodedData forKey:key];
    [defaults setObject:list forKey:@"ListOfGames"];
    
//    [defaults setObject:encodedData forKey:key]; //???????????????
    [defaults synchronize];
}
- (void)deleteData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
    
    [list removeObjectForKey:self.pointer];
    [defaults setObject:list forKey:@"ListOfGames"];
    [defaults synchronize];
}

-(void)removeDataForKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

@end
