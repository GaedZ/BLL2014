//
//  HighscoresForMode.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 04.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighscoresForMode : NSObject

@property (nonatomic) NSNumber *easyScore;
@property (nonatomic) NSNumber *mediumScore;
@property (nonatomic) NSNumber *hardScore;

-(id)initDefault;

@end