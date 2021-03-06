//
//  SettingsViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 01.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "SettingsViewController.h"
#import "Highscores.h"

@implementation SettingsViewController
{
    Gamedata *gamedata;
}

- (void)useSettings
{
    gamedata = [[Gamedata alloc] initDefault];
    for (UISwitch *swItem in _difficultyCollection) {
        if (swItem.on)
            gamedata.settings.difficulty = swItem.tag;
    }
    for (UISwitch *swItem in _modeCollection) {
        if (swItem.on)
            gamedata.settings.mode = swItem.tag;
    }
    gamedata.settings.perspective = self.segmentedControlPerspective.selectedSegmentIndex;
    gamedata.settings.saveOn = self.switchSave.on;
    gamedata.settings.automaticSaveOn = self.switchAutoSave.on;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showGameFromSett"]) {
        [self useSettings];
        GameViewController *currentGameViewController = (GameViewController *)segue.destinationViewController;
        currentGameViewController.gamedata = gamedata;        
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

# pragma mark
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
#pragma mark Setup Switch Behaviour

- (IBAction)Schwierigkeit:(UISwitch*)sender
{
    if (_switch2Players == sender)
        _segmentedControlPerspective.enabled = NO;
    else
        _segmentedControlPerspective.enabled = YES;

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

#pragma mark
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[tableView cellForRowAtIndexPath:indexPath].reuseIdentifier isEqualToString:@"ResetScoreCell"] )
    {
        [Highscores resetHighscores];
        [[[UIAlertView alloc]initWithTitle:@"Alle Highscores wurden zurückgesetzt"
                                   message:nil
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles: nil] show];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
}
@end
