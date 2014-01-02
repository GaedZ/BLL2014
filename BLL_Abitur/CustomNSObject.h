//
//  CustomNSObject.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 02.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
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
    Medium,
    Hard
}Difficulty;
typedef enum {SCORER, WINNER} Perspective;

#pragma mark

@interface CustomNSObject : NSObject

@end
