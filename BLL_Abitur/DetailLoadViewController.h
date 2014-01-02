//
//  DetailLoadViewController.h
//  BuWeA4
//
//  Created by Georg Zänker on 07.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gamedata.h"

@interface DetailLoadViewController : UITableViewController <UITableViewDelegate>

@property (nonatomic, retain) Gamedata *gamedata;

#pragma mark
#pragma mark Basis Info
@property (weak, nonatomic) IBOutlet UITableViewCell *NumberCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *lastSavedCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *turnCell;

#pragma mark Einstellungen
@property (weak, nonatomic) IBOutlet UITableViewCell *difficultyCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *modeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *perspectiveCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *saveTypeCell;

    
@end
