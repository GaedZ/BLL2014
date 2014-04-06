//
//  HighscoresForMode.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import "HighscoresForMode.h"

@implementation HighscoresForMode

-(id)initDefault
{
    self = [super init];
    if (self) {
        
        self.easyScore = [NSNumber numberWithInt:0];
        self.mediumScore = [NSNumber numberWithInt:0];
        self.hardScore = [NSNumber numberWithInt:0];
        
    }
    return self;
}

#pragma mark
#pragma mark Encoden/Decoden

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.easyScore = [decoder decodeObjectForKey: @"Easy"];
        self.mediumScore = [decoder decodeObjectForKey: @"Medium"];
        self.hardScore = [decoder decodeObjectForKey: @"Hard"];
    }
    return self;
}
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.easyScore forKey: @"Easy"];
    [encoder encodeObject:self.mediumScore forKey: @"Medium"];
    [encoder encodeObject:self.hardScore forKey: @"Hard"];
}

#pragma mark
#pragma mark Laden/Speichern

+ (HighscoresForMode*)saveHighscore:(int)score forPower2withDifficulty:(Difficulty)difficulty inHighscoreForMode:(HighscoresForMode *)hSFM
{
    if (difficulty == Easy) {
        hSFM.easyScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Medium) {
        hSFM.mediumScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Hard) {
        hSFM.hardScore = [NSNumber numberWithInt:score]; return hSFM; }
    return Nil;
}
+ (HighscoresForMode*)saveHighscore:(int)score forPower3withDifficulty:(Difficulty)difficulty inHighscoreForMode:(HighscoresForMode *)hSFM
{
    if (difficulty == Easy) {
        hSFM.easyScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Medium) {
        hSFM.mediumScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Hard) {
        hSFM.hardScore = [NSNumber numberWithInt:score]; return hSFM; }
    return Nil;
}
+ (HighscoresForMode*)saveHighscore:(int)score forPower4withDifficulty:(Difficulty)difficulty inHighscoreForMode:(HighscoresForMode *)hSFM
{
    if (difficulty == Easy) {
        hSFM.easyScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Medium) {
        hSFM.mediumScore = [NSNumber numberWithInt:score]; return hSFM; }
    if (difficulty == Hard) {
        hSFM.hardScore = [NSNumber numberWithInt:score]; return hSFM; }
    return Nil;
}

@end
