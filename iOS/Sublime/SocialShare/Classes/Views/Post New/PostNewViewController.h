//
//  PostNewViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"
#import "PostNewToolBar.h"

@import CoreLocation;
@import MapKit;
@import MobileCoreServices;
@import QuartzCore;


@interface PostNewViewController : CustomNavViewController<PostNewToolBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    IBOutlet UIImageView * imgvwPhoto;
    
    IBOutlet UITextView * textView;
    
    PostNewToolBar * toolBar;
}


@property(nonatomic, strong) UIImagePickerController* pickerController;
@property(nonatomic, strong) IBOutlet UIImageView* selectedPic;




-(IBAction)selectPhoto;
-(IBAction)uploadPhoto;


@end
