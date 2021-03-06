//
//  GameViewController.h
//  BuWeA4
//
//  Created by Georg Zänker on 16.07.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadViewController.h"

#import "NSNumber+Numberchecker.h"
#import "Computerplays.h"
#import "Gamedata.h"

typedef enum {PlayerOne, PlayerTwo} WhosTurn;
typedef enum {StateOne, StateTwo} Button;

@class GameViewController;

@interface GameViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

#pragma mark
#pragma mark Setup Grund-Elemente
@property (nonatomic, retain) Gamedata *gamedata;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *ButtonEnde;

- (IBAction)endGame:(id)sender;

#pragma mark
#pragma mark Eingabe-Elemente

@property (weak, nonatomic) IBOutlet UITextField *vorneTextField;
@property (weak, nonatomic) IBOutlet UITextField *hintenTextField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ActionButtons;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)pushedButton:(UIButton*)sender;

#pragma mark
#pragma mark Highscores-Labels

@property (weak, nonatomic) IBOutlet UILabel *easyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mediumLabel;
@property (weak, nonatomic) IBOutlet UILabel *hardLabel;

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;


@end
