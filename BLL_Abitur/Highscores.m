//
//  Highscores.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import "Highscores.h"

@implementation Highscores

-(id)initDefault {
    self = [super init];
    if (self) {
        self.power2 = [[HighscoresForMode alloc] initDefault];
        self.power3 = [[HighscoresForMode alloc] initDefault];
        self.power4 = [[HighscoresForMode alloc] initDefault];
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.power2 = [decoder decodeObjectForKey: @"Power2"];
        self.power3 = [decoder decodeObjectForKey: @"Power3"];
        self.power4 = [decoder decodeObjectForKey: @"Power4"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.power2 forKey: @"Power2"];
    [encoder encodeObject:self.power3 forKey: @"Power3"];
    [encoder encodeObject:self.power4 forKey: @"Power4"];
}

#pragma mark
#pragma mark Laden/Speichern

+ (HighscoresForMode *)loadHighscoresForMode:(Mode)mode
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedData = [defaults objectForKey:@"Highscores"];
    Highscores *highscores = (Highscores *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedData];
    if (mode == Power2)
        return highscores.power2;
    if (mode == Power3)
        return highscores.power3;
    if (mode == Power4)
        return highscores.power4;
    return nil;
}

+ (void) resetHighscores
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    Highscores *highscores = [[Highscores alloc] initDefault];
    NSData *encodedData     = [NSKeyedArchiver archivedDataWithRootObject:highscores];
    [defaults setObject:encodedData forKey:@"Highscores"];
}

+ (void)saveHighscore:(int)score withSettings:(Settings *)settings
{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *encodedData = [defaults objectForKey:@"Highscores"];
//
//    NSMutableDictionary *list     = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
//    
////    NSData *encodedData      = [NSKeyedArchiver archivedDataWithRootObject:self];
////    [list setObject:encodedData forKey:key];
////    [defaults setObject:list forKey:@"ListOfGames"];
////    
////    [defaults setObject:encodedData forKey:key];
////    [defaults synchronize];dData forKey:key];
////    [defaults synchronize];
//}
//- (void)deleteData {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSMutableDictionary *list = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
//    
//    [list removeObjectForKey:self.pointer];
//    [defaults setObject:list forKey:@"ListOfGames"];
//    [defaults synchronize];
}

@end
