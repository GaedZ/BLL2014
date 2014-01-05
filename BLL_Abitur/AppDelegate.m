//
//  AppDelegate.m
//  BLL_Abitur
//
//  Created by Georg Zänker on 31.12.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "AppDelegate.h"
#import "Highscores.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"ListOfGames"] == nil) {
        NSMutableDictionary *list = [NSMutableDictionary new];
        [defaults setObject:list forKey:@"ListOfGames"];
    }
    if ([defaults objectForKey:@"Highscores"] == nil) {
        Highscores *highscores = [[Highscores alloc] initDefault];
        NSData *encodedData     = [NSKeyedArchiver archivedDataWithRootObject:highscores];
        [defaults setObject:encodedData forKey:@"Highscores"];
    }
    [defaults synchronize];
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if (iOSDeviceScreenSize.height == 568)
    {   // iPhone 5 and iPod Touch 5th generation: 4 inch screen
        // Instantiate a new storyboard object using the storyboard file named MainStoryboardR4
        UIStoryboard *iPhoneR4Storyboard = [UIStoryboard storyboardWithName:@"MainR4" bundle:nil];
        
        UIViewController *initialViewController = [iPhoneR4Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
    }
    else
    {
        // iPhone 4S and iPod Touch 4th generation: 3.5 inch screen
        // Instantiate a new storyboard object using the storyboard file named MainStoryboard
        UIStoryboard *iPhoneStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *initialViewController = [iPhoneStoryboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
    }
    [self.window makeKeyAndVisible];
    
    //Custom Layout
    [[UINavigationBar appearance] setBarTintColor:[UIColor brownColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor],NSForegroundColorAttributeName,
                                                          [UIFont fontWithName:@"HelveticaNeue" size:21.0],NSBackgroundColorAttributeName,nil]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
