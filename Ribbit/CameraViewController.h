//
//  CameraViewController.h
//  Ribbit
//
//  Created by Enrique Gonzalez on 9/23/13.
//  Copyright (c) 2013 Enrique Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <Parse/Parse.h>

@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *videoFilePath;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSMutableArray *recipients;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;

- (void)uploadMessage;
- (void)reset;
- (UIImage*)resizeImage:(UIImage*)image toWidth:(float)width andHeight:(float)height;

@end
