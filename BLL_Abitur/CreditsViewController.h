//
//  CreditsViewController.h
//  BuWeA4
//
//  Created by Georg Zänker on 01.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreditsViewController;

@protocol CreditsViewControllerDelegate
- (void)creditsViewControllerDidFinish:(CreditsViewController *)controller;
@end

@interface CreditsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) id <CreditsViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
