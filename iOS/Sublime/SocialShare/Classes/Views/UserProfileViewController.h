//
//  UserProfileViewController.h
//  sublime
//
//  Created by Shane Dickson on 3/15/14.
//
//

#import <UIKit/UIKit.h>
#import "AppController.h"



@import CoreImage;
@import CoreMedia;
@import ImageIO;
@import QuartzCore;
@import MobileCoreServices;
@import CoreLocation;
@import AVFoundation;


@interface UserProfileViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    int currentPageIndex;
    
}


@property (nonatomic, strong) IBOutlet UIImageView* userProfilePhoto;
@property(nonatomic, strong) UIImagePickerController* pickerController;
@property(nonatomic, strong) IBOutlet UIScrollView* scrollView;


-(IBAction)changeUserProfilePhoto:(id)sender;
-(IBAction)performScrollLeft:(id)sender;
-(IBAction)performScrollRight:(id)sender;

@end
