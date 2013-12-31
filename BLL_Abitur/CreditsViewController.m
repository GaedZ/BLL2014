//
//  CreditsViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 01.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if (iOSDeviceScreenSize.height == 480)
    {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed: @"NavBar-Wood.png"]
                                 forBarMetrics: UIBarMetricsDefault];
        self.barButtonItem.tintColor = [UIColor brownColor];
        UIImageView *imageView;
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BLL_TafelBG"]];

    }
    if (iOSDeviceScreenSize.height == 568)
    {
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate creditsViewControllerDidFinish:self];
}

@end

