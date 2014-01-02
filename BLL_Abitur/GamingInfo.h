//
//  GamingInfo.h
//  BLL_Abitur
//
//  Created by Georg Zänker on 02.01.14.
//  Copyright (c) 2014 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamingInfo : NSObject

@property(nonatomic) NSString* number;
@property(nonatomic) int turn;
@property(nonatomic) NSDate* lastSaved;

-(id)initDefault;

@end
