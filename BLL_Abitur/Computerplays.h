//
//  Computerplays.h
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

typedef enum {VorneP, HintenP} Position;

@interface Computerplays : NSObject

+ (NSString*)playGameWithAI:(Difficulty)currentDifficulty Perspective:(Perspective)currentPerspective andMode:(Mode)currentMode usingTheNumber:(NSString*)number;

+ (NSString*)makeRandomMoveUsingTheNumber:(NSString*)number;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number withMode:(Mode)currentMode andPerspective:(Perspective)currentPerpective;

+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower2UsingThePerspective:(Perspective)finalPerspective;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower3UsingThePerspective:(Perspective)finalPerspective;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower4UsingThePerspective:(Perspective)finalPerspective;

@end
