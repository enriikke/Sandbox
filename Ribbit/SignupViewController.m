//
//  SignupViewController.m
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/18/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)signup:(id)sender {
    NSString *username = [[self.usernameField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [[self.emailField text]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [[self.passwordField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [email length] == 0 || [password length] == 0) {
        UIAlertView *invalidAlert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                               message:@"Make sure you enter a username, password, and email address!"
                                                              delegate:nil
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
        
        [invalidAlert show];
    }
    else {
        PFUser *newuser = [PFUser user];
        [newuser setUsername:username];
        [newuser setPassword:password];
        [newuser setEmail:email];
        
        [newuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                     message:[[error userInfo] objectForKey:@"error"]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
                [errorAlert show];
            } else {
                [[self navigationController] popToRootViewControllerAnimated:YES];
            }
        }];
    }
}
@end
