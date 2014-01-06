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

#pragma mark
#pragma mark Öffentliche Methode
+ (NSString*)playGameWithSettings:(Settings *)settings usingTheNumber:(NSString *)number
{
    switch (settings.difficulty) {
        case Easy:
            number = [self makeRandomMoveUsingTheNumber: number];
        case Medium:
            {
            srand (time(NULL));
            BOOL randomlySkilledMove  = rand() %  2;
            if (randomlySkilledMove)
                number = [self makeRandomMoveUsingTheNumber: number];
            else
                number = [self makeSkilledMoveUsingTheNumber:number withSettings:settings];
        }
        case Hard:
            number = [self makeSkilledMoveUsingTheNumber:number withSettings:settings];
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
        ;
    switch (settings.mode) {
        case Power2:
            return [self makeSkilledMoveAsWinnerForPower2UsingTheNumber:number];
        case Power3:
            return [self makeSkilledMoveAsWinnerForPower3UsingTheNumber:number];
        case Power4:
            return [self makeSkilledMoveAsWinnerForPower4UsingTheNumber:number];
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
    int w = 0;
    int s = 0;
    int64 tempNumber = [number longLongValue];
        
    while ([NSNumber isCubic:(tempNumber*10 + w)] || [NSNumber isCubic:(tempNumber*100 + w*10 + s)] || (s == 10)) {
        w++; s = 0;
        while (![NSNumber isCubic:(tempNumber*100 + w*10 + s)] && (s < 9))
            s++;
    }
        
    return [number stringByAppendingString:[NSString stringWithFormat:@"%d", w]];
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

//+ (NSString*)makeSkilledMoveAsScorerUsingTheNumber:(NSString*)number forMode:(Mode)mode {
//    NSString *tempNumber;
//    
//    for (int i = 0; i < 10; i++) {
//        tempNumber = [number stringByAppendingString:[NSString stringWithFormat:@"%i",i]];
//        if ([NSNumber isNumber:[tempNumber longLongValue] forMode:mode])
//            return tempNumber;
//    }
//    for (int i = 0; i < 10; i++) {
//        tempNumber = [[NSString stringWithFormat:@"%i",i] stringByAppendingString:number];
//        if ([NSNumber isNumber:[tempNumber longLongValue] forMode:mode])
//            return tempNumber;
//    }
//    
//    
//    
//    Position randomPosition  = rand() %  2;
//    if (randomPosition == Vorne) {
//        <#statements#>
//    }
//    else if (randomPosition == Hinten)
//    {
//        
//    }
//    
//    return nil;
//}
//+ (NSString*)case1WithNumber:(NSString*)number
//{
//    int randomA;
//    int randomB;
//    NSString *tempNumberA;
//    NSString *tempNumberB;
//    const int maxTest = 12;
//    
//    for (int i = 0; i <= maxTest; i++) {
//        randomB = rand() % 10;
//        tempNumberB = [[NSString stringWithFormat:@"%i",randomB] stringByAppendingString:number];
//        for (int i = 1; i < (); <#increment#>) {
//            <#statements#>
//        }
//    }
//    return nil;
//}

@end
