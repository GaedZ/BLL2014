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
    
    self.navigationItem.title = self.gamedata.pointer;
    //Basis Info
    [self.NumberCell.detailTextLabel setText: self.gamedata.pointer];
    [self.turnCell.detailTextLabel setText:[NSString stringWithFormat:@"%i", self.gamedata.gamingInfo.turn]];
    [self fillLastSavedLabel];
    //Einstellungen
    [self fillDifficultyCell];
    [self fillModeCell];
    [self fillPerpectiveCell];
    [self fillSaveTypeCell];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Formatierung

- (void)fillLastSavedLabel{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [self.lastSavedCell.detailTextLabel setText:[dateFormatter stringFromDate:self.gamedata.gamingInfo.lastSaved]];
}

- (void)fillDifficultyCell{
    switch (self.gamedata.settings.difficulty) {
        case PvP:
            [self.difficultyCell.detailTextLabel setText:@"Spieler gegen Spieler"];
            break;
        case Easy:
            [self.difficultyCell.detailTextLabel setText:@"Leicht"];
            break;
        case Intermediate:
            [self.difficultyCell.detailTextLabel setText:@"Mittel"];
            break;
        case Hard:
            [self.difficultyCell.detailTextLabel setText:@"Schwer"];
            break;
        default:
            break;
    }
}
- (void)fillModeCell{
    switch (self.gamedata.settings.mode) {
        case Power2:
            [self.modeCell.detailTextLabel setText:@"Quadrat"];
            break;
        case Power3:
            [self.modeCell.detailTextLabel setText:@"Kubig"];
            break;
        case Power4:
            [self.modeCell.detailTextLabel setText:@"Hoch 4"];
            break;
        default:
            break;
    }
}
- (void)fillPerpectiveCell{
    switch (self.gamedata.settings.perspective) {
        case SCORER:
            [self.perspectiveCell.detailTextLabel setText:@"Scorer"];
            break;
        case WINNER:
            [self.perspectiveCell.detailTextLabel setText:@"Winner"];
            break;
        default:
            break;
    }
}
- (void)fillSaveTypeCell{
    if (self.gamedata.settings.saveOn) {
        [self.saveTypeCell.detailTextLabel setText:@"Manuelles Speichern"];
    }
    if (self.gamedata.settings.automaticSaveOn) {
        [self.saveTypeCell.detailTextLabel setText:@"Automatisches Speichern"];
    }
}


@end
