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

#pragma mark

@interface Settings : NSObject

@property(nonatomic,readwrite) Difficulty difficulty;
@property(nonatomic,readwrite) Mode mode;
@property(nonatomic,readwrite) Perspective perspective;
@property(nonatomic,readwrite) BOOL saveOn;
@property(nonatomic,readwrite) BOOL automaticSaveOn;

-(id)initDefault;

@end
