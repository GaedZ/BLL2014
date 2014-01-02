//
//  Gamedata.m
//  BuWeA4
//
//  Created by Georg Zänker on 29.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Gamedata.h"

@implementation Gamedata
-(id)initDefault {
    self = [super init];
    if (self) {
        self.gamingInfo = [[GamingInfo alloc]initDefault];
        self.settings = [[Settings alloc]initDefault];
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.gamingInfo = [decoder decodeObjectForKey:@"GamingInfo"];
        self.settings = [decoder decodeObjectForKey:    @"Settings"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.gamingInfo forKey:@"GamingInfo"];
    [encoder encodeObject:self.settings forKey: @"Settings"];
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
    if (list[key])
    {
        [self showFileDoesNotExistBox];
    }
    if (!list[key])
    {
        NSData *encodedData      = [NSKeyedArchiver archivedDataWithRootObject:self];
        [list setObject:encodedData forKey:key];
        [defaults setObject:list forKey:@"ListOfGames"];
        
        [defaults setObject:encodedData forKey:key];
        [defaults synchronize];
    }
}
- (void)deleteData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *list = [[defaults objectForKey:@"ListOfGames"] mutableCopy];
    [list removeObjectForKey:self.pointer];
    [defaults setObject:list forKey:@"ListOfGames"];
    [defaults synchronize];
}

#pragma mark
#pragma mark Alert Boxes
- (void)showFileDoesNotExistBox {
    UIAlertView *FileDoesNotExistBox = [[UIAlertView alloc] initWithTitle:@"Achtung"
                                                            message:@"Ein Spielstand mit diesem Namen existiert bereits. Überschreiben?"
                                                            delegate:self
                                                            cancelButtonTitle:nil
                                                            otherButtonTitles:@"Ja",@"Nein", nil];
    [FileDoesNotExistBox show];
}
//- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
//    NSLog(@"somethig");
//    switch (buttonIndex) {
//            
//        case 0:
//        {
//            [[NSUserDefaults standardUserDefaults]removeObjectForKey:self.name];
//        }
//        break;
//            
//        default:
//        break;
//    }
//}
@end
