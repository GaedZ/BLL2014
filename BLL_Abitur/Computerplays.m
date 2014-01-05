//
//  Computerplays.m
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Computerplays.h"
#import "NSNumber+Numberchecker.h"

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
    if (finalPerspective == WINNER) {
            //ANFANG
            if ([number isEqualToString:@""])
                return @"7";
            
            int64 tempNumber = [number longLongValue];
            tempNumber = tempNumber * 10 + 2;
            
            if (![NSNumber isSquare:tempNumber])
            {
                int i = 0;
                while (![NSNumber isSquare:(tempNumber * 10 + i)] && i!=10)
                    i++;
                if (i == 10)
                    return number = [number stringByAppendingString:@"2"];
                else
                    return number = [number stringByAppendingString:@"3"];
            }
            else
                return number = [number stringByAppendingString:@"3"];
            //ENDE
        }
    if (finalPerspective == SCORER) {
        
        
        
        
//        statements;
    }
    return nil;
}
    
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower3UsingThePerspective:(Perspective)finalPerspective
{
    if (finalPerspective == WINNER) {
        //ANFANG
        if ([number isEqualToString:@""])
            return @"5";
        
        int s = 0;
        int w = 0;
        int64 tempNumber = [number longLongValue];
        
        while ([NSNumber isCubic:(tempNumber*10 + s)] && w != 10) {
//            w = 0;
            while ((![NSNumber isCubic:(tempNumber*100 + s*10 + w)] && w!=10))
                w++;
            if ([NSNumber isCubic:(tempNumber*10 + s)] || w != 10)
                s++; w = 0;
        }
        
        return [number stringByAppendingString:[NSString stringWithFormat:@"%d", s]];
        //ENDE
    }
    else if (finalPerspective == SCORER)
    {
        //            statements
    }
    return nil;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number andPower4UsingThePerspective:(Perspective)finalPerspective;
{
    if (finalPerspective == WINNER) {

        //ANFANG
        if ([number isEqualToString:@""])
            return @"9";
            
        int64 tempNumber = [number longLongValue];
        tempNumber = tempNumber * 10 + 7;
        
        if (![NSNumber isPower4:tempNumber])
        {
            int i = 0;
            while (![NSNumber isPower4:(tempNumber * 10 + i)] && i!=10)
                i++;
            if (i == 10)
                return number = [number stringByAppendingString:@"7"];
            else
                return number = [number stringByAppendingString:@"8"];
        }
        else
            return number = [number stringByAppendingString:@"8"];
        //ENDE
    }
    else if (finalPerspective == SCORER)
    {
        //
    }
    return nil;
}

@end
