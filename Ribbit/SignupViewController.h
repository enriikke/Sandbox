//
//  SignupViewController.h
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/18/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)signup:(id)sender;

@end
