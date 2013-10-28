//
//  InboxViewController.m
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/18/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import "InboxViewController.h"

@interface InboxViewController ()

@end

@implementation InboxViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //[testObject setObject:@"bar" forKey:@"foo"];
    //[testObject save];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Current user: %@", [currentUser username]);
    }
    else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showLogin"]) {
        [[segue destinationViewController] setHidesBottomBarWhenPushed:YES];
    }
}
@end
