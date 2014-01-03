//
//  Computerplays.m
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Computerplays.h"
#import "Numberchecker.h"

@interface Computerplays ()

+ (NSString*)makeRandomMoveUsingTheNumber:(NSString*)number;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number withMode:(Mode)currentMode andPerspective:(Perspective)perspective;

+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower2UsingThePerspective:(Perspective)finalPerspective;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower3UsingThePerspective:(Perspective)finalPerspective;
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower4UsingThePerspective:(Perspective)finalPerspective;

@end

@implementation Computerplays

+ (NSString*)playGameWithSettings:(Settings *)settings usingTheNumber:(NSString *)number
{
    switch (settings.difficulty) {
        case Easy:
            number = [self makeRandomMoveUsingTheNumber: number];
            break;
        case Medium:
            {
            srand (time(NULL));
            BOOL randomlySkilledMove  = rand() %  2;
            if (randomlySkilledMove)
                number = [self makeRandomMoveUsingTheNumber: number];
            else
                number = [self makeSkilledMoveUsingTheNumber:number withMode:settings.mode andPerspective:settings.perspective];
        }
            break;
        case Hard:
            number = [self makeSkilledMoveUsingTheNumber:number withMode:settings.mode andPerspective:settings.perspective];
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
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number withMode:(Mode)mode andPerspective:(Perspective)perspective
{
    if ([number isEqualToString:@""] && perspective == WINNER)
        return @"7";
    
    switch (mode) {
        case Power2:
            return [self makeSkilledMoveUsingTheNumber:number andPower2UsingThePerspective:perspective];
            break;
        case Power3:
            return [self makeSkilledMoveUsingTheNumber:number andPower3UsingThePerspective:perspective];
            break;
        case Power4:
            return [self makeSkilledMoveUsingTheNumber:number andPower4UsingThePerspective:perspective];
            break;
        default:
            break;
    }
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower2UsingThePerspective:(Perspective)finalPerspective
{
    switch (finalPerspective) {
        case SCORER: {
            ;
            break;
        }
        case WINNER: {
            
            NSString *tempNumber = [number stringByAppendingString:@"2"];
            if (![Numberchecker isSquare:[tempNumber longLongValue]]) {
                int i = 0;
                while (![Numberchecker isSquare:([tempNumber longLongValue]*10 + i)] && i!=10)
                {
                    i++;
                }
                if (i == 10)
                {
                    return number = [number stringByAppendingString:@"2"];
                }
                
            else
            {
                return number = [number stringByAppendingString:@"3"];
            }
            break;
            }
            else {
                return number = [number stringByAppendingString:@"3"];
            }
    
        }
        default: {
            break;
        }
    }
    return nil;
}
    
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower3UsingThePerspective:(Perspective)finalPerspective
{
    switch (finalPerspective)
    {
//        case SCORER:
//        {
//            statements
//            break;
//        }
//        case WINNER:
//        {
//            statements
//            break;
//        }
        default:
            break;
    }
    
    return nil;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower4UsingThePerspective:(Perspective)finalPerspective;
{
    switch (finalPerspective) {
//        case SCORER:
//        {
//            statements
//            break;
//        }
//        case WINNER:
//        {
//            statements
//            break;
//        }
        default:
            break;
    }
    
    return nil;
}

@end
