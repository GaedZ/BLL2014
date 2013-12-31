//
//  MenuViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 16.07.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

//- (void)resetDefaults {
//    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
//    NSDictionary * dict = [defs dictionaryRepresentation];
//    for (id key in dict) {
//        [defs removeObjectForKey:key];
//    }
//    [defs synchronize];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // change the color of the navigation bar.
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if (iOSDeviceScreenSize.height == 480)
    {
        UIImage *imageNavBar = [UIImage imageNamed: @"NavBar-Wood.png"];
        UINavigationBar *navigationBar = self.navigationController.navigationBar;
        
        [navigationBar setBackgroundImage:imageNavBar forBarMetrics: UIBarMetricsDefault];
        self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    }
    if (iOSDeviceScreenSize.height == 568)
    {
    }
    
    //change the Background to wanted pic
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BLL_TafelBG@2x.png"]];
// UIGraphicsBeginImageContext(self.view.frame.size);
// [[UIImage imageNamed:@"BLL_TafelBG@2x.png"] drawInRect:self.view.bounds];
//   UIImage *imageBG = UIGraphicsGetImageFromCurrentImageContext();
//   UIGraphicsEndImageContext();
//   
//   self.view.backgroundColor = [UIColor colorWithPatternImage:imageBG];
     }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Information View

- (void)creditsViewControllerDidFinish:(CreditsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
