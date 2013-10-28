//
//  FriendsViewController.h
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/22/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "EditFriendsViewController.h"

@interface FriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;

@end
