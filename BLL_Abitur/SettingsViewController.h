//
//  SettingsViewController.h
//  BuWeA4
//
//  Created by Georg Zänker on 01.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gamedata.h"
#import "GameViewController.h"



@interface SettingsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

#pragma mark Perpektive
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlPerspective;

#pragma mark Schwierigkeit Switches
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *difficultyCollection;
@property (weak, nonatomic) IBOutlet UISwitch *switch2Players;
@property (weak, nonatomic) IBOutlet UISwitch *switchEasy;
@property (weak, nonatomic) IBOutlet UISwitch *switchMedium;
@property (weak, nonatomic) IBOutlet UISwitch *switchHard;
- (IBAction)Schwierigkeit:(UISwitch*)sender;

#pragma mark Modus Switches
@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *modeCollection;
@property (weak, nonatomic) IBOutlet UISwitch *switchQuadratzahlen;
@property (weak, nonatomic) IBOutlet UISwitch *switchKubigzahlen;
@property (weak, nonatomic) IBOutlet UISwitch *switchHoch4Zahlen;
- (IBAction)Modus:(UISwitch*)sender;

#pragma mark System Setting Switches
@property (weak, nonatomic) IBOutlet UISwitch *switchSave;
@property (weak, nonatomic) IBOutlet UISwitch *switchAutoSave;
- (IBAction)systemSettings:(UISwitch*)sender;

#pragma mark Done!
- (void)useSettings;


@end
