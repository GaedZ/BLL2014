//
//  Computerplays.m
//  BuWeA4
//
//  Created by Georg Zänker on 06.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "Computerplays.h"
#import "NSNumber+Numberchecker.h"

@implementation Computerplays
{
    Settings *ownSettings;
}

#pragma mark Test Methods

//+(NSString*)returnNumberForDemonstrationPurposesUsingTheNumber:(NSString *)number {
//        if ([number isEqualToString:@""])
//            return [number stringByAppendingString:@"3"];
//        if ([number isEqualToString:@"34"])
//            return [@"0" stringByAppendingString:number];
//        if ([number isEqualToString:@"1034"])
//            return [number stringByAppendingString:@"1"];
//    return nil;
//}
//#pragma mark
//#pragma mark Öffentliche Methode
+ (NSString*)playGameWithSettings:(Settings *)settings usingTheNumber:(NSString *)number
{
//    //Method for Demonstration purposes
//    if (settings.difficulty == Easy && settings.perspective == WINNER && settings.mode == Power3)
//        return [self returnNumberForDemonstrationPurposesUsingTheNumber:number];
    
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
                number = [self makeSkilledMoveUsingTheNumber:number withSettings:settings];
            }
            break;
        case Hard:
            number = [self makeSkilledMoveUsingTheNumber:number withSettings:settings];
            break;
        default:
            break;
    }
    return number;
}

#pragma mark
#pragma mark Willkürlicher und Perfekter Spielzug
+ (NSString*)makeRandomMoveUsingTheNumber:(NSString*)number
{
    srand (time(NULL));
    int randomNumber = rand() % 10;
    Position randomPosition  = rand() %  2;
    
    if (randomPosition)
        return [number stringByAppendingString:[NSString stringWithFormat:@"%i",randomNumber]];
    else if(!randomPosition)
        return [[NSString stringWithFormat:@"%i",randomNumber] stringByAppendingString:number];
    
    return number;
}
+ (NSString*)makeSkilledMoveUsingTheNumber:(NSString*)number withSettings:(Settings*)settings
{
    if (settings.perspective == SCORER)
        return [self makeSkilledMoveAsScorerUsingTheNumber:number forMode:settings.mode];
    switch (settings.mode) {
        case Power2:
            return [self makeSkilledMoveAsWinnerForPower2UsingTheNumber:number];
            break;
        case Power3:
            return [self makeSkilledMoveAsWinnerForPower3UsingTheNumber:number];
            break;
        case Power4:
            return [self makeSkilledMoveAsWinnerForPower4UsingTheNumber:number];
            break;
        default:
            break;
    }
}

#pragma mark
#pragma mark Perfekter Zug Für Scorer/Winner
+ (NSString*)makeSkilledMoveAsWinnerForPower2UsingTheNumber:(NSString*)number {
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
+ (NSString*)makeSkilledMoveAsWinnerForPower3UsingTheNumber:(NSString*)number {
    //ANFANG
    NSString *tempNumberW;
    NSString *tempNumberWS;
    NSString *STempNumberW;
    BOOL playerCouldPossiblyWin;
    
    for (int w = 0; w < 10; w++) {
        tempNumberW = [number stringByAppendingString:[NSString stringWithFormat:@"%i", w]];
        playerCouldPossiblyWin = NO;

        for (int s = 0; s < 10; s++) {
            tempNumberWS = [tempNumberW stringByAppendingString:[NSString stringWithFormat:@"%i", s]];
            STempNumberW = [[NSString stringWithFormat:@"%i", s] stringByAppendingString:tempNumberW];
            
            if ([NSNumber isCubic:[tempNumberWS longLongValue]])
                playerCouldPossiblyWin = YES;
            if ([NSNumber isCubic:[STempNumberW longLongValue]])
                playerCouldPossiblyWin = YES;
        }
        if (playerCouldPossiblyWin == NO && [NSNumber isCubic:[tempNumberW longLongValue]] == NO)
            return tempNumberW;

    }
    return @"";
    //ENDE
}
+ (NSString*)makeSkilledMoveAsWinnerForPower4UsingTheNumber:(NSString*)number {
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
#pragma mark

+ (NSString*)makeSkilledMoveAsScorerUsingTheNumber:(NSString*)number forMode:(Mode)mode {
    
    if ([self tryFirstTurnWinWithNumber:number forMode:mode] != nil) {
        return [self tryFirstTurnWinWithNumber:number forMode:mode];
    }
    
    Position randomPosition  = rand() %  2;
    if (randomPosition == Vorne) {
        if ([self case1WithNumber:number forMode:mode] == nil) {
            if ([self case2WithNumber:number forMode:mode] == nil)
                return [number stringByAppendingString:[NSString stringWithFormat:@"%i", (rand() % 10)]];
            else
                return [self case2WithNumber:number forMode:mode];
        }
        else {
            return [self case1WithNumber:number forMode:mode];
        }
    }
    else if (randomPosition == Hinten)
    {
        if ([self case2WithNumber:number forMode:mode] == nil) {
            if ([self case1WithNumber:number forMode:mode] == nil)
                return [number stringByAppendingString:[NSString stringWithFormat:@"%i", (rand() % 10)]];
            else
                return [self case1WithNumber:number forMode:mode];
        }
        else {
            return [self case2WithNumber:number forMode:mode];
        }
    }
    
    return nil;
}
#pragma mark

+ (NSString*)tryFirstTurnWinWithNumber:(NSString*)number forMode:(Mode)mode {
    NSString *tempNumber;
    
    for (int i = 0; i < 10; i++) {
        tempNumber = [number stringByAppendingString:[NSString stringWithFormat:@"%i",i]];
        if ([NSNumber isNumber:[tempNumber longLongValue] forMode:mode])
            return tempNumber;
    }
    for (int i = 0; i < 10; i++) {
        tempNumber = [[NSString stringWithFormat:@"%i",i] stringByAppendingString:number];
        if ([NSNumber isNumber:[tempNumber longLongValue] forMode:mode])
            return tempNumber;
    }
    return nil;
}
+ (NSString*)case1WithNumber:(NSString*)number forMode:(Mode)mode
{
    int randomS;
    int randomW;
    NSString *tempNumberS;
    NSString *tempNumberW;
    const int maxTest = 12;
    
    for (int s = 0; s <= maxTest; s++) {
        randomW = rand() % 10;
        tempNumberW = [[NSString stringWithFormat:@"%i",randomW] stringByAppendingString:number];
        for (int w = 1; w < (2*maxTest); w++) {
            randomS = rand() % 10;
            if (w <= maxTest)
                tempNumberS = [tempNumberW stringByAppendingString:[NSString stringWithFormat:@"%i",randomS]];
            else
                tempNumberS = [[NSString stringWithFormat:@"%i",randomS] stringByAppendingString:tempNumberW];
            
            if ([self tryFirstTurnWinWithNumber:tempNumberW forMode:mode] != nil) {
                return tempNumberW;
            }
        }
    }
    return nil;
}
+ (NSString*)case2WithNumber:(NSString*)number forMode:(Mode)mode
{
    int randomS;
    int randomW;
    NSString *tempNumberS;
    NSString *tempNumberW;
    const int maxTest = 12;
    
    for (int s = 0; s <= maxTest; s++) {
        randomW = rand() % 10;
        tempNumberW = [number stringByAppendingString:[NSString stringWithFormat:@"%i",randomW]];
        for (int w = 1; w < (2*maxTest); w++) {
            randomS = rand() % 10;
            if (w <= maxTest)
                tempNumberS = [tempNumberW stringByAppendingString:[NSString stringWithFormat:@"%i",randomS]];
            else
                tempNumberS = [[NSString stringWithFormat:@"%i",randomS] stringByAppendingString:tempNumberW];
            
            if ([self tryFirstTurnWinWithNumber:tempNumberW forMode:mode] != nil) {
                return tempNumberW;
            }
        }
    }
    return nil;
}

@end
