//
//  LoadViewController.h
//  BuWeA4
//
//  Created by Georg Zänker on 07.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gamedata.h"
#import "DetailLoadViewController.h"
#import "GameViewController.h"

@interface LoadViewController : UITableViewController

@property(nonatomic, retain) Gamedata *gamedata;

@end
