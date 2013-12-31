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

@property (nonatomic, retain) Gamedata *detailGamedata;

#pragma mark
#pragma mark Basis Info
@property (weak, nonatomic) IBOutlet UITableViewCell *IDLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *lastSavedLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *turnLabel;

#pragma mark Einstellungen
@property (weak, nonatomic) IBOutlet UITableViewCell *difficultyLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *modeLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *perspectiveLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *saveTypeLabel;

    
@end
