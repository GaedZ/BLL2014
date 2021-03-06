//
//  Gamedata.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 29.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GamingInfo.h"
#import "Settings.h"

@interface Gamedata: NSObject <NSCoding>

@property (nonatomic) Settings* settings;
@property (nonatomic) GamingInfo* gamingInfo;

@property(nonatomic) NSString* pointer;

#pragma mark
- (id)initDefault;

#pragma mark
#pragma mark Laden/Speichern
+ (Gamedata *)loadGamedataWithKey:(NSString *)key;
- (void)saveDataforKey:(NSString*)key;
- (void)deleteData;

@end
