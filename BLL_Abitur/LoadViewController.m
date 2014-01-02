//
//  LoadViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 07.10.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "LoadViewController.h"

@interface LoadViewController ()

@end

@implementation LoadViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];    
    
    // Edit Button
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:@"ListOfGames"] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loadCell"];
    
    cell.textLabel.text = [[[[NSUserDefaults standardUserDefaults] objectForKey:@"ListOfGames"] allKeys] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.loadGamedata = [Gamedata loadGamedataWithKey:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [self performSegueWithIdentifier:@"showDetailView" sender:self];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.loadGamedata = [Gamedata loadGamedataWithKey:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [self performSegueWithIdentifier:@"showGameFromLoad" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender == self) {
        if ([[segue identifier]isEqualToString:@"showGameFromLoad"]) {
            GameViewController *currentGameViewController = (GameViewController *)segue.destinationViewController;
            currentGameViewController.gameGamedata = self.loadGamedata;
            //currentGameViewController.navigationItem.hidesBackButton = YES;
        }
        if ([[segue identifier]isEqualToString:@"showDetailView"]) {
            DetailLoadViewController *viewController = (DetailLoadViewController*)segue.destinationViewController;
            viewController.detailGamedata = self.loadGamedata;
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Gamedata *toBeDeletedData = [Gamedata loadGamedataWithKey:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
        [toBeDeletedData deleteData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
