//
//  GameViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 16.07.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "GameViewController.h"
#import "MenuViewController.h"
#import "Highscore.h"

@implementation GameViewController

# pragma mark
-(void)viewDidLoad {
    
    //Set up Highscore Labels
    {
        Highscore *highscore = [[NSUserDefaults standardUserDefaults] objectForKey:@"Highscores"];
        
        switch (self.gamedata.settings.mode) {
            case Power2:
                self.easyLabel.text = [highscore.Power2 objectAtIndex:Easy];
                self.mediumLabel.text = [highscore.Power2 objectAtIndex:Medium];
                self.hardLabel.text = [highscore.Power2 objectAtIndex:Hard];
                break;
            case Power3:
                self.easyLabel.text = [highscore.Power2 objectAtIndex:Easy];
                self.mediumLabel.text = [highscore.Power2 objectAtIndex:Medium];
                self.hardLabel.text = [highscore.Power2 objectAtIndex:Hard];
                break;
            case Power4:
                self.easyLabel.text = [highscore.Power2 objectAtIndex:Easy];
                self.mediumLabel.text = [highscore.Power2 objectAtIndex:Medium];
                self.hardLabel.text = [highscore.Power2 objectAtIndex:Hard];
                break;
            default:
                break;
        }
    }
    
    //Set up numberLabel
    [self.numberLabel setText:@""];
    if (self.gamedata.gamingInfo.number != nil)
        [self.numberLabel setText:self.gamedata.gamingInfo.number];

    //Set up both TextFields
    {
    self.hintenTextField.delegate = self;
    self.vorneTextField.delegate = self;
    self.vorneTextField.text = @"";
    self.hintenTextField.text = @"";
    }
    
    //Hide NavigationButton and set up Scrollview
    {
    self.navigationItem.hidesBackButton = YES;
    self.scrollView.contentSize = CGSizeMake(self.numberLabel.frame.size.width, self.scrollView.contentSize.height);
    }
    
    //Check whether its the Computers turn to place the first number
    if (self.gamedata.settings.difficulty != PvP &&
        self.gamedata.settings.perspective == WINNER &&
        self.gamedata.gamingInfo.turn == 0)
    {
        [self putComputersNumber];
    }
}

#pragma mark
#pragma mark The Game

- (IBAction)pushedButton:(UIButton*)sender{
    switch (sender.tag) {
        case StateOne:
            if ([sender.titleLabel.text isEqualToString:@" î Vorne"]){
                self.vorneTextField.enabled = TRUE;
                [self.ActionButtons[0] setTitle: @"  Chancel" forState:UIControlStateNormal];
                [self.ActionButtons[1] setTitle:@" Done" forState:UIControlStateNormal];
                [self.vorneTextField becomeFirstResponder];
                for (UIButton *buItem in self.ActionButtons) {
                    buItem.tag = StateTwo;}
            }
            else if ([sender.titleLabel.text isEqualToString:@"Hinten î"]){
                self.hintenTextField.enabled = TRUE;
                [self.ActionButtons[0] setTitle: @"  Chancel" forState:UIControlStateNormal];
                [self.ActionButtons[1] setTitle:@" Done" forState:UIControlStateNormal];
                [self.hintenTextField becomeFirstResponder];
                for (UIButton *buItem in self.ActionButtons) {
                    buItem.tag = StateTwo;}
            }
        break;
        case StateTwo:
        {
            if ([sender.titleLabel.text isEqualToString:@" Done"]){
                if ([self.vorneTextField.text isEqualToString: @""] && [self.hintenTextField.text isEqualToString: @""]) {
                    [self showErrorbox];
                }
                else
                {
                    [self putPlayersNumber];
                    
                    if ([Numberchecker isNumber:[NSNumber numberWithUnsignedLongLong:[self.numberLabel.text longLongValue]] forMode:self.gamedata.settings.mode]) {
                        
                        [self showEndbox];
                    }

                    
                    if (self.gamedata.settings.difficulty != PvP){
                    [self putComputersNumber];
                        
                    
                        if ([Numberchecker isNumber:[NSNumber numberWithUnsignedLongLong:[self.numberLabel.text longLongValue]] forMode:self.gamedata.settings.mode]) {
                        
                        [self showEndbox];
                    }
                    }
                    if (self.gamedata.settings.difficulty == PvP){
                        if (self.gamedata.gamingInfo.turn % 2 == 0)
                            [self.statusLabel setText:@"Spieler 1 am Zug"];
                        else if (self.gamedata.gamingInfo.turn % 2 == 1)
                            [self.statusLabel setText:@"Spieler 2 am Zug"];
                    }

                    
                    [self prepareDefaultState];
                }
            }
            else if ([sender.titleLabel.text isEqualToString:@"  Chancel"]){
                [self prepareDefaultState];
            }
        }
        break;

    }
}
- (void)putPlayersNumber{
    if (self.vorneTextField.enabled)
        [self.numberLabel setText:[self.vorneTextField.text stringByAppendingString:self.numberLabel.text]];
    if (self.hintenTextField.enabled)
        [self.numberLabel setText:[self.numberLabel.text stringByAppendingString: self.hintenTextField.text]];
    self.gamedata.gamingInfo.turn++;
}
- (void)putComputersNumber{
    for (UIButton *buItem in self.ActionButtons) {
        buItem.enabled = NO;}
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.statusLabel.alpha = 0.0f;
                         self.statusLabel.text = @"Computer denkt nach";
                         self.statusLabel.alpha = 2.0f;
                     }];
    [self.numberLabel setText: [Computerplays playGameWithSettings:self.gamedata.settings usingTheNumber:self.numberLabel.text]];
    for (UIButton *buItem in self.ActionButtons) {
        buItem.enabled = YES;}
    self.statusLabel.text = @"Du bist dran!";
    self.gamedata.gamingInfo.turn++;
}
- (void)prepareDefaultState{
    [self.hintenTextField resignFirstResponder];
    [self.vorneTextField resignFirstResponder];
    [self.ActionButtons[0] setTitle: @" î Vorne" forState:UIControlStateNormal];
    [self.ActionButtons[1] setTitle:@"Hinten î" forState:UIControlStateNormal];
    self.vorneTextField.text = @"";
    self.hintenTextField.text = @"";
    self.vorneTextField.enabled = FALSE;
    self.hintenTextField.enabled = FALSE;
    for (UIButton *buItem in self.ActionButtons) {
        buItem.tag = StateOne;}
}
- (void)resetField{
    self.gamedata.gamingInfo.turn = 0;
    self.numberLabel.text = @"";
    self.statusLabel.text = @"Spieler 1 am Zug";
}

#pragma mark
#pragma End of Game

- (IBAction)endGame:(UIButton*)sender{
    if (self.gamedata.settings.saveOn && self.gamedata.gamingInfo.turn != 0)
    {
        if (self.gamedata.settings.automaticSaveOn) {
    
            [[self preparedData] saveDataforKey:[NSString stringWithFormat:@"Spiel vom %@", [self stringForDate:[self preparedData].gamingInfo.lastSaved]]];
            
            //Zurück zum Hauptmenü
            NSArray *VCs = [self.navigationController viewControllers];
            [self.navigationController popToViewController:[VCs objectAtIndex:([VCs count] - 3)] animated:YES];
        }
        else
        {
            [self showSavebox];
        }
    }
    else
    {
        //Zurück zum Hauptmenü
        NSArray *VCs = [self.navigationController viewControllers];
        [self.navigationController popToViewController:[VCs objectAtIndex:([VCs count] - 3)] animated:YES];
  
    }
    self.gamedata = nil;
}

#pragma mark
#pragma mark Alarmboxen

- (void)showSavebox{
    UIAlertView *Savebox = [[UIAlertView alloc]
                                initWithTitle: @"Speichern"
                                      message: @"Geben Sie einen Namen für das Spiel ein!"
                                     delegate: self
                            cancelButtonTitle: @"Nicht Speichern"
                             otherButtonTitles: @"Speichern", nil];
    Savebox.alertViewStyle = UIAlertViewStylePlainTextInput;
    [Savebox show];
}
- (void)showEndbox{
    UIAlertView *Endbox = [[UIAlertView alloc]
                               initWithTitle: @"Spiel vorbei"
                                     message: @"Score:"
                                    delegate: self
                           cancelButtonTitle: nil
                           otherButtonTitles: @"Spiel beenden", @"Neues Spiel", nil];
    [Endbox show];
}
- (void)showErrorbox{
    UIAlertView *Errorbox = [[UIAlertView alloc]
                                  initWithTitle: @"Ungültige Eingabe"
                                  message: @"Geben Sie bitte eine Ziffer ein"
                                  delegate: self
                                  cancelButtonTitle: @"Ok"
                                  otherButtonTitles: nil];
    [Errorbox show];
}
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if ([alertView.title isEqualToString:@"Spiel vorbei"]) {
        if (buttonIndex == 0) {
            [self resetField];
            
            NSArray *VCs = [self.navigationController viewControllers];
            [self.navigationController popToViewController:[VCs objectAtIndex:([VCs count] - 3)] animated:YES];
        }
        else if (buttonIndex == 1)
        {
            [self resetField];
        }
    }
    else if ([alertView.title isEqualToString:@"Speichern"])
    {
        if (buttonIndex == 0) {
        }
        else if(buttonIndex == 1)
        {
            [[self preparedData] saveDataforKey:[alertView textFieldAtIndex:0].text];
        }
       
        //Zurück zum Hauptmenü
        NSArray *VCs = [self.navigationController viewControllers];
        [self.navigationController popToViewController:[VCs objectAtIndex:([VCs count] - 3)] animated:YES];
    }

}

#pragma mark
#pragma mark Aufhübschung

- (void)blinkAnimation:(NSString *)animationID finished:(BOOL)finished target:(UIView *)target{
    NSString *selectedSpeed = [[NSUserDefaults standardUserDefaults] stringForKey:@"EffectSpeed"];
    float speedFloat = (1.00 - [selectedSpeed floatValue]);
    
    [UIView beginAnimations:animationID context:(__bridge void *)(target)];
    [UIView setAnimationDuration:speedFloat];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(blinkAnimation:finished:target:)];
    
    if([target alpha] == 1.0f)
        [target setAlpha:0.0f];
    else
        [target setAlpha:1.0f];
    [UIView commitAnimations];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 1) ? NO : YES;
}
- (void)hideText{
    [UIView beginAnimations:@"fadeOutText" context:NULL];
    [UIView setAnimationDuration:1.0];
    self.statusLabel.alpha = 0.0f;
    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(setText)
                                   userInfo:nil
                                    repeats:NO];
}
- (void)showText{
    [UIView beginAnimations:@"fadeInText" context:NULL];
    [UIView setAnimationDuration:1.0];
    self.statusLabel.alpha = 1.0f;
    [UIView commitAnimations];
}
- (NSString*)stringForDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:date];
}
- (Gamedata*)preparedData
{
    Gamedata *preparedData = [[Gamedata alloc]initDefault];
    preparedData.settings = self.gamedata.settings;
    preparedData.gamingInfo.number = self.numberLabel.text;
    preparedData.gamingInfo.turn = self.gamedata.gamingInfo.turn;
    preparedData.gamingInfo.lastSaved = [NSDate date];
    return preparedData;
}
@end