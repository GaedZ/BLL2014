//
//  GameViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 16.07.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "GameViewController.h"
#import "MenuViewController.h"

@implementation GameViewController
{
    NSDictionary *Highscores;
}

# pragma mark
-(void)viewDidLoad {
    
    [self.numberLabel setText:_gameGamedata.number];

    self.hintenTextField.delegate = self;
    self.vorneTextField.delegate = self;
    self.vorneTextField.text = @"";
    self.hintenTextField.text = @"";
    
    self.navigationItem.hidesBackButton = YES;

    self.scrollView.contentSize = CGSizeMake(_numberLabel.frame.size.width, self.scrollView.contentSize.height);
    
    if (self.gameGamedata.usedSettings.currentDifficulty != PvP &&
        self.gameGamedata.usedSettings.currentPerspective == WINNER &&
        self.gameGamedata.turn == 0)
    {
        _statusLabel.text = @"Computer denkt nach";
        
         for (UIButton *buItem in _ActionButtons) {
             buItem.enabled = NO;}
        _numberLabel.text = @"7";
        _gameGamedata.turn++;
        for (UIButton *buItem in _ActionButtons) {
            buItem.enabled = YES;}
 
        _statusLabel.text = @"Du bist am Zug";
        
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
                for (UIButton *buItem in _ActionButtons) {
                    buItem.tag = StateTwo;}
            }
            else if ([sender.titleLabel.text isEqualToString:@"Hinten î"]){
                self.hintenTextField.enabled = TRUE;
                [self.ActionButtons[0] setTitle: @"  Chancel" forState:UIControlStateNormal];
                [self.ActionButtons[1] setTitle:@" Done" forState:UIControlStateNormal];
                [self.hintenTextField becomeFirstResponder];
                for (UIButton *buItem in _ActionButtons) {
                    buItem.tag = StateTwo;}
            }
        break;
        case StateTwo:
        {
            if ([sender.titleLabel.text isEqualToString:@" Done"]){
                if ([_vorneTextField.text isEqualToString: @""] && [_hintenTextField.text isEqualToString: @""]) {
                    [self showErrorbox];
                }
                else
                {
                    [self putPlayersNumber];
                    if ([Numberchecker isNumber:[NSNumber numberWithUnsignedLongLong:[_numberLabel.text longLongValue]] forMode:self.gameGamedata.usedSettings.currentMode]) {
                        [self showEndbox];
                    }
                    _gameGamedata.turn++;

                    
                    if (self.gameGamedata.usedSettings.currentDifficulty != PvP){
                    [self putComputersNumber];
                    if ([Numberchecker isNumber:[NSNumber numberWithUnsignedLongLong:[_numberLabel.text longLongValue]] forMode:self.gameGamedata.usedSettings.currentMode]) {
                        [self showEndbox];
                    }
                    _gameGamedata.turn++;
                    }
                    if (self.gameGamedata.usedSettings.currentDifficulty == PvP){
                        if (_gameGamedata.turn % 2 == 0)
                            [_statusLabel setText:@"Spieler 1 am Zug"];
                        else if (_gameGamedata.turn % 2 == 1)
                            [_statusLabel setText:@"Spieler 2 am Zug"];
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
        [self.numberLabel setText:[self.vorneTextField.text stringByAppendingString:_numberLabel.text]];
    if (self.hintenTextField.enabled)
        [self.numberLabel setText:[_numberLabel.text stringByAppendingString: self.hintenTextField.text]];
}
- (void)putComputersNumber{
    
    for (UIButton *buItem in _ActionButtons) {
        buItem.enabled = NO;}
    [UIView animateWithDuration:1.0
                     animations:^{
                         _statusLabel.alpha = 0.0f;
                         _statusLabel.text = @"Computer denkt nach";
                         _statusLabel.alpha = 2.0f;
                     }];
    [self.numberLabel setText: [Computerplays playGameWithAI:   self.gameGamedata.usedSettings.currentDifficulty
                                           Perspective:         self.gameGamedata.usedSettings.currentPerspective
                                               andMode:         self.gameGamedata.usedSettings.currentMode
                                        usingTheNumber:         _numberLabel.text]];
    for (UIButton *buItem in _ActionButtons) {
        buItem.enabled = YES;}
//    _statusLabel.text = @"Du bist dran!";
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
    for (UIButton *buItem in _ActionButtons) {
        buItem.tag = StateOne;}
}
- (void)resetField{
    _gameGamedata.turn = 0;
    _numberLabel.text = @"";
    _statusLabel.text = @"Spieler 1 am Zug";
}

#pragma mark
#pragma End of Game

- (IBAction)endGame:(UIButton*)sender{
    if (self.gameGamedata.usedSettings.saveOn) {
        if (self.gameGamedata.usedSettings.automaticSaveOn) {
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
    _gameGamedata = nil;
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
            Gamedata *preparedData = [[Gamedata alloc]initDefault];
            preparedData.usedSettings = self.gameGamedata.usedSettings;
            preparedData.number = self.numberLabel.text;
            preparedData.turn = _gameGamedata.turn;
            preparedData.lastSaved = [NSDate date];
            preparedData.name = [alertView textFieldAtIndex:0].text;
            [Gamedata saveGamedata:preparedData forKey:[alertView textFieldAtIndex:0].text];
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
-(void)hideText{
    [UIView beginAnimations:@"fadeOutText" context:NULL];
    [UIView setAnimationDuration:1.0];
    _statusLabel.alpha = 0.0f;
    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(setText)
                                   userInfo:nil
                                    repeats:NO];
}
-(void)showText{
    [UIView beginAnimations:@"fadeInText" context:NULL];
    [UIView setAnimationDuration:1.0];
    _statusLabel.alpha = 1.0f;
    [UIView commitAnimations];
}
@end