//
//  SettingsViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 01.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
{
    Gamedata *settingsGamedata;
}

- (void)useSettings
{
    settingsGamedata = [[Gamedata alloc] initDefault];
    for (UISwitch *swItem in _difficultyCollection) {
        if (swItem.on)
            settingsGamedata.usedSettings.currentDifficulty = swItem.tag;
    }
    for (UISwitch *swItem in _modeCollection) {
        if (swItem.on)
            settingsGamedata.usedSettings.currentMode = swItem.tag;
    }
    settingsGamedata.usedSettings.currentPerspective = self.segmentedControlPerspective.selectedSegmentIndex;
    settingsGamedata.usedSettings.saveOn = self.switchSave.on;
    settingsGamedata.usedSettings.automaticSaveOn = self.switchAutoSave.on;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showGameFromSett"]) {
        [self useSettings];
        GameViewController *currentGameViewController = (GameViewController *)segue.destinationViewController;
        currentGameViewController.gameGamedata = settingsGamedata;        
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark

- (IBAction)Schwierigkeit:(UISwitch*)sender
{

    if (_switch2Players != sender){
        [_switch2Players setOn: !sender.on animated:YES];
        _switch2Players.enabled = YES;
    }
    if (_switchEasy != sender){
        [_switchEasy setOn: !sender.on animated:YES];
        _switchEasy.enabled = YES;
    }
    if (_switchMedium != sender){
        [_switchMedium setOn: !sender.on animated:YES];
        _switchMedium.enabled = YES;
    }
    if (_switchHard != sender){
        [_switchHard setOn: !sender.on animated:YES];
        _switchHard.enabled = YES;
    }
    sender.enabled = NO;
}

- (IBAction)Modus:(UISwitch*)sender
{
    if (_switchQuadratzahlen != sender){
        [_switchQuadratzahlen setOn: !sender.on animated:YES];
        _switchQuadratzahlen.enabled = YES;
    }
    if (_switchKubigzahlen != sender){
        [_switchKubigzahlen setOn: !sender.on animated:YES];
        _switchKubigzahlen.enabled = YES;
    }
    if (_switchHoch4Zahlen != sender){
        [_switchHoch4Zahlen setOn: !sender.on animated:YES];
        _switchHoch4Zahlen.enabled = YES;
    }
    sender.enabled = NO;
}

- (IBAction)systemSettings:(UISwitch*)sender
{
    if (_switchSave.on)
        _switchAutoSave.enabled = YES;
    else {
        [_switchAutoSave setOn: NO animated:YES];
        _switchAutoSave.enabled = NO;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 2) {
        [[[UIAlertView alloc]initWithTitle:@"Highscore" message:@"Test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}
@end
