//
//  FriendsViewController.m
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/22/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import "FriendsViewController.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setFriendsRelation:[[PFUser currentUser] objectForKey:@"FriendsRelation"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery *query = [[self friendsRelation] query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            [self setFriends:objects];
            [[self tableView] reloadData];
        }
    }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showEditFriends"]) {
        EditFriendsViewController *viewController = (EditFriendsViewController *)[segue destinationViewController];
        [viewController setFriends:[NSMutableArray arrayWithArray:[self friends]]];
    }
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
    return [[self friends] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFUser *user = [[self friends] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText: [user username]];
    
    return cell;
}


@end
