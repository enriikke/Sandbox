//
//  LoginViewController.m
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/18/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self navigationItem] setHidesBackButton:YES];
}


- (IBAction)login:(id)sender {
    NSString *username = [[self.usernameField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [[self.passwordField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0) {
        UIAlertView *invalidAlert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                               message:@"Make sure you enter a username and password!"
                                                              delegate:nil
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
        
        [invalidAlert show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                     message:[[error userInfo] objectForKey:@"error"]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
                [errorAlert show];
            }
            else {
                [[self navigationController] popToRootViewControllerAnimated:YES];
            }
        }];
    }
}
@end
