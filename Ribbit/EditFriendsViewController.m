//
//  EditFriendsViewController.m
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/22/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import "EditFriendsViewController.h"

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setCurrentUser:[PFUser currentUser]];
    
    PFQuery *userQuery = [PFUser query];
    [userQuery orderByAscending:@"username"];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            self.allUsers = objects;
            [[self tableView] reloadData];
        }
    }];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[user username]];
    
    if ([self isFriend:user]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self tableView] deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    PFRelation *friendsRelation = [[self currentUser] relationforKey:@"FriendsRelation"];
    
    if ([self isFriend:user]) {
        
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        for (PFUser *friend in [self friends]) {
            if ([[friend objectId] isEqualToString:[user objectId]]) {
                [[self friends] removeObject:friend];
                break;
            }
        }
        [friendsRelation removeObject:user];
        
    } else {
        
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [[self friends] addObject:user];
        [friendsRelation addObject:user];
    }
    
    
    [[self currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

#pragma mark - Helper methods

- (BOOL) isFriend:(PFUser *)user {
    for (PFUser *friend in [self friends]) {
        if ([[friend objectId] isEqualToString:[user objectId]]) {
            return YES;
        }
    }
    
    return NO;
}

@end
