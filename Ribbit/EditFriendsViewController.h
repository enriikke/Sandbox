//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/22/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *friends;

- (BOOL) isFriend:(PFUser *)user;

@end
