//
//  DetailLoadViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 07.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "DetailLoadViewController.h"

@interface DetailLoadViewController ()

@end

@implementation DetailLoadViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
        
    //Basis Info
    [self.IDLabel.detailTextLabel setText: _detailGamedata.name];
    [self.turnLabel.detailTextLabel setText:[NSString stringWithFormat:@"%i", _detailGamedata.turn]];
    [self fillLastSavedLabel];
    //Einstellungen
    [self fillDifficultyLabel];
    [self fillModeLabel];
    [self fillPerpectiveLabel];
    [self fillSaveTypeLabel];
}
-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return _detailGamedata.number;
    }
    else
    {
        return nil;
    }
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Formatierung

- (void)fillLastSavedLabel{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [self.lastSavedLabel.detailTextLabel setText:[dateFormatter stringFromDate:_detailGamedata.lastSaved]];
}

- (void)fillDifficultyLabel{
    switch (self.detailGamedata.usedSettings.currentDifficulty) {
        case PvP:
            [self.difficultyLabel.detailTextLabel setText:@"Spieler gegen Spieler"];
            break;
        case Easy:
            [self.difficultyLabel.detailTextLabel setText:@"Leicht"];
            break;
        case Intermediate:
            [self.difficultyLabel.detailTextLabel setText:@"Mittel"];
            break;
        case Hard:
            [self.difficultyLabel.detailTextLabel setText:@"Schwer"];
            break;
        default:
            break;
    }
}
- (void)fillModeLabel{
    switch (self.detailGamedata.usedSettings.currentMode) {
        case Power2:
            [self.modeLabel.detailTextLabel setText:@"Quadrat"];
            break;
        case Power3:
            [self.modeLabel.detailTextLabel setText:@"Kubig"];
            break;
        case Power4:
            [self.modeLabel.detailTextLabel setText:@"Hoch 4"];
            break;
        default:
            break;
    }
}
- (void)fillPerpectiveLabel{
    switch (self.detailGamedata.usedSettings.currentPerspective) {
        case SCORER:
            [self.perspectiveLabel.detailTextLabel setText:@"Scorer"];
            break;
        case WINNER:
            [self.perspectiveLabel.detailTextLabel setText:@"Winner"];
            break;
        default:
            break;
    }
}
- (void)fillSaveTypeLabel{
    if (self.detailGamedata.usedSettings.saveOn) {
        [self.saveTypeLabel.detailTextLabel setText:@"Manuelles Speichern"];
    }
    if (self.detailGamedata.usedSettings.automaticSaveOn) {
        [self.saveTypeLabel.detailTextLabel setText:@"Automatisches Speichern"];
    }
}


@end
