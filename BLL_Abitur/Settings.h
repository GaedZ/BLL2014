//
//  Settings.h
//  BuWeA4
//
//  Created by Georg Zänker on 04.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Konstanten Typedefs
typedef enum{
    Power2 = 0,
    Power3,
    Power4
}Mode;
typedef enum{
    PvP = 0,
    Easy,
    Intermediate,
    Hard
}Difficulty;

typedef enum {SCORER, WINNER} Perspective;
typedef unsigned long long int int64;
typedef unsigned long int int32;
typedef unsigned short int16;

#pragma mark

@interface Settings : NSObject

@property(nonatomic,readwrite) Difficulty currentDifficulty;
@property(nonatomic,readwrite) Mode currentMode;
@property(nonatomic,readwrite) Perspective currentPerspective;
@property(nonatomic,readwrite) BOOL saveOn;
@property(nonatomic,readwrite) BOOL automaticSaveOn;

-(id)initDefault;

@end
