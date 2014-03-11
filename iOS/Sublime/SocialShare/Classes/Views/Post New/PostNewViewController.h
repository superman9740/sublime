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
#import <QuartzCore/QuartzCore.h>
#import "AppController.h"
#import "CropImageViewController.h"


@import CoreImage;
@import CoreMedia;
@import ImageIO;
@import QuartzCore;
@import MobileCoreServices;
@import CoreLocation;
@import AVFoundation;


@interface PostNewViewController : CustomNavViewController<PostNewToolBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    IBOutlet UIImageView * imgvwPhoto;
    
    IBOutlet UITextView * textView;
    
    PostNewToolBar * toolBar;
    BOOL usingFrontCamera;
    
    
}


@property(nonatomic, strong) UIImagePickerController* pickerController;
@property(nonatomic, strong) IBOutlet UIImageView* selectedPic;
@property (strong, nonatomic) AVCaptureStillImageOutput* stillImageOutput;
@property (strong, nonatomic) AVCaptureSession* session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer* previewLayer;

@property (nonatomic, strong) IBOutlet UIView* cameraView;




-(IBAction)selectPhoto;
-(IBAction)uploadPhoto;
-(IBAction)takePhoto:(id)sender;
- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer;

-(void)setupCaptureSession:(AVCaptureDevice*)camera;


@end
