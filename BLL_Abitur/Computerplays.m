//
//  Computerplays.m
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Computerplays.h"

@implementation Computerplays

+ (NSString*)playGameWithAI:(Difficulty)currentDifficulty Perspective:(Perspective)currentPerspective andMode:(Mode)currentMode usingTheNumber:(NSString*)number;
{
    switch (currentDifficulty) {
        case Easy:
            number = [self makeRandomMoveUsingTheNumber: number];
            break;
        case Intermediate:
            {
            srand (time(NULL));
            BOOL randomlySkilledMove  = rand() %  2;
            if (randomlySkilledMove)
                number = [self makeRandomMoveUsingTheNumber: number];
            else
                number = [self makeSkilledMoveUsingTheNumber:number withMode:currentMode andPerspective:currentPerspective];
        }
            break;
        case Hard:
            number = [self makeSkilledMoveUsingTheNumber:number withMode:currentMode andPerspective:currentPerspective];
            break;
        default:
            break;
    }
    return number;
}
+ (NSString*)makeRandomMoveUsingTheNumber:(NSString*)number
{
    srand (time(NULL));
    int randomNumber = rand() % 10;
    BOOL randomPosition  = rand() %  2;
    
    if (randomPosition) {
        return [number stringByAppendingString:[NSString stringWithFormat:@"%i",randomNumber]];
    }
    else if(!randomPosition)
    {
        return [[NSString stringWithFormat:@"%i",randomNumber] stringByAppendingString:number];
    }
    return number;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number withMode:(Mode)currentMode andPerspective:(Perspective)currentPerpective
{
    switch (currentMode) {
        case Power2:
            return [self makeSkilledMoveUsingTheNumber:number andPower2UsingThePerspective:currentPerpective];
            break;
        case Power3:
            return [self makeSkilledMoveUsingTheNumber:number andPower3UsingThePerspective:currentPerpective];
            break;
        case Power4:
            return [self makeSkilledMoveUsingTheNumber:number andPower4UsingThePerspective:currentPerpective];
            break;
        default:
            break;
    }
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower2UsingThePerspective:(Perspective)finalPerspective
{
    return nil;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower3UsingThePerspective:(Perspective)finalPerspective
{
    return nil;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower4UsingThePerspective:(Perspective)finalPerspective;
{
    return nil;
}

@end
