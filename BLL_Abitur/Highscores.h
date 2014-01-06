//
//  Highscores.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HighscoresForMode.h"

@interface Highscores : NSObject <NSCoding>

@property (nonatomic) HighscoresForMode *power2;
@property (nonatomic) HighscoresForMode *power3;
@property (nonatomic) HighscoresForMode *power4;


#pragma mark
- (id)initDefault;

#pragma mark
#pragma mark Laden/Speichern

+ (HighscoresForMode *)loadHighscoresForMode:(Mode)mode;
+ (void)saveHighscore:(int)score withSettings:(Settings*)settings;
+ (void)resetHighscores;

@end
