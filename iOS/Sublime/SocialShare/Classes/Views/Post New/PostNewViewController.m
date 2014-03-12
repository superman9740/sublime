//
//  PostNewViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "PostNewViewController.h"


static inline double radians (double degrees) {return degrees * M_PI/180;}


@interface PostNewViewController ()

@end

@implementation PostNewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self insertNavBarWithScreenName:STRDIC_POSTNEW];
    
    
    // Add ToolBar
    toolBar = (PostNewToolBar *)[[PostNewToolBar alloc] viewFromStoryboard];
    [toolBar setFrame:CGRectMake( 0, 800, 320, 36)];
    toolBar.delegate = self;
    [self.view addSubview:toolBar];
    
    
    _previewLayer.frame = _cameraView.frame;
    [self setupCaptureSession:[self backCamera]];
    
    
    // Set Photo & Content
//    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:@""]];
//    [textView setText:@""];
}

#pragma mark AVFoundation
- (AVCaptureDevice *)frontCamera {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionFront)
        {
            usingFrontCamera = YES;
            
            return device;
        }
    }
    return nil;
}

- (AVCaptureDevice *)backCamera {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionBack)
        {
            usingFrontCamera = NO;
            
            return device;
        }
    }
    return nil;
}

- (void)setupCaptureSession:(AVCaptureDevice*)camera
{
    NSError *error = nil;
    
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPresetHigh;
    
    
    error=nil;
    AVCaptureInput* cameraInput = [[AVCaptureDeviceInput alloc] initWithDevice:camera error:&error];
    
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    [_session addInput:cameraInput];
    
    [_session startRunning];
    
    
    
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _previewLayer.frame = _cameraView.frame;
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [_previewLayer.connection setVideoOrientation:AVCaptureVideoOrientationPortrait];
    
    [_cameraView.layer addSublayer:_previewLayer];
    
    [self setStillImageOutput:[[AVCaptureStillImageOutput alloc] init]];
    
    NSDictionary *outputSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA], (id)kCVPixelBufferPixelFormatTypeKey, nil];
    
    [[self stillImageOutput] setOutputSettings:outputSettings];
    
    
    [_session addOutput:[self stillImageOutput]];
    
    
    
    
}




-(IBAction)takePhoto:(id)sender
{
    if([[UIDevice currentDevice] orientation] != UIInterfaceOrientationPortrait)
        return;
    
    
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in [[self stillImageOutput] connections]) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) {
            break;
        }
    }
    
    NSLog(@"about to request a capture from: %@", [self stillImageOutput]);
    [[self stillImageOutput] captureStillImageAsynchronouslyFromConnection:videoConnection
                                                         completionHandler:^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
                                                             CFDictionaryRef exifAttachments = CMGetAttachment(imageSampleBuffer, kCGImagePropertyExifDictionary, NULL);
                                                             if (exifAttachments)
                                                             {
                                                                 NSLog(@"attachements: %@", exifAttachments);
                                                             } else
                                                             {
                                                                 NSLog(@"no attachments");
                                                             }
                                                             
                                                             
                                                             UIImage *image=[self imageFromSampleBuffer:imageSampleBuffer];
                                                             [[AppController sharedInstance] setSelectedImage:image];
                                                             
                                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                                 
                                                                 SSPhotoCropperViewController *photoCropper =  [self.storyboard instantiateViewControllerWithIdentifier:@"cropView"];

                                                                 [photoCropper initWithPhoto:image
                                                                                                            delegate:self
                                                                                                              uiMode:SSPCUIModePresentedAsModalViewController
                                                                                                     showsInfoButton:YES];
                                                                 [photoCropper setMinZoomScale:0.75f];
                                                                 [photoCropper setMaxZoomScale:1.50f];
                                                                 UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:photoCropper];
                                                                 [self presentViewController:nc animated:YES completion:nil];
                                                                 
                                                             });
                                                             
                                                             
                                                         }];
    
    
    
    
    
}




- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // Get the number of bytes per row for the pixel buffer
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    
    // Get the number of bytes per row for the pixel buffer
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // Create a bitmap graphics context with the sample buffer data
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = [UIImage imageWithCGImage:quartzImage];
    //return image;
    
    CFRelease(context);
    
    
    CGSize size = CGSizeMake(800,800);
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(size);
    
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, size.width/2, size.height/2);
    
    CGContextRotateCTM(bitmap, radians(90));
    CGContextScaleCTM(bitmap, 1.0f, -1.0f);
    CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), [image CGImage]);
    
    UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return rotatedImage;
    
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showToolBar:(BOOL)show
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[toolBar setFrame:CGRectMake( 0, (show) ? self.view.frame.size.height - 250 : 800, 320, 36 )];
	[UIView commitAnimations];
}

#pragma mark --
#pragma mark -- UITextViewDelegate --
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self showToolBar:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self showToolBar:NO];
}


#pragma mark --
#pragma mark -- PostNewToolBarDelegate --
- (void) didToolbarCameraButtonClick:(PostNewToolBar *)pntb
{
    [textView resignFirstResponder];
}

- (void) didToolbarBrightButtonClick:(PostNewToolBar *)pntb
{
    ;
}

- (void) didToolbarContrastButtonClick:(PostNewToolBar *)pntb
{
    ;
}

- (void) didToolbarPinButtonClick:(PostNewToolBar *)pntb
{
    ;
}


#pragma mark --
#pragma mark -- CustomNavBarViewDelegate --
- (void) didClickNavBarLeftButton
{
    ;
}

- (void) didClickNavBarRightButton
{
    [textView resignFirstResponder];
}




-(IBAction)selectPhoto
{
    
    _pickerController = [[UIImagePickerController alloc] init];
    _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    _pickerController.mediaTypes =     [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    _pickerController.allowsEditing = NO;
    _pickerController.delegate = self;
    
    [self presentModalViewController:_pickerController animated:YES];
    

    
}

-(IBAction)uploadPhoto
{
    [NSThread sleepForTimeInterval:2];
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Upload", nil) message:NSLocalizedString(@"Your upload is on it's way!", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [alertView show];
    _selectedPic.image = nil;
    
    
}

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        //Rotate image to view coordinates
     /*
        UIGraphicsBeginImageContext(imageToSave.size);
        
        CGContextRef bitmap = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, imageToSave.size.width/2, imageToSave.size.height/2);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, radians(90));
        CGContextScaleCTM(bitmap, 1.0f, -1.0f);
        // Now, draw the rotated/scaled image into the context
        CGContextDrawImage(bitmap, CGRectMake(-imageToSave.size.width / 2, -imageToSave.size.height / 2, imageToSave.size.width, imageToSave.size.height), [imageToSave CGImage]);
        
        UIImage *rotatedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
       */
        
        
     //   _imageView.image = rotatedImage;
        
        
        
    }
    
    
    _selectedPic.image = originalImage;
    
    
    
    
    
    CGSize size = CGSizeMake(800,800);
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(size);
    
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, size.width/2, size.height/2);
    
    //CGContextRotateCTM(bitmap, radians(90));
    CGContextScaleCTM(bitmap, 1.0f, -1.0f);
    CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), [originalImage CGImage]);
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    

    
    
    
    [_pickerController dismissViewControllerAnimated:YES completion:^{
   
        SSPhotoCropperViewController *photoCropper =  [self.storyboard instantiateViewControllerWithIdentifier:@"cropView"];
        
        [photoCropper initWithPhoto:scaledImage
                           delegate:self
                             uiMode:SSPCUIModePresentedAsModalViewController
                    showsInfoButton:YES];
        [photoCropper setMinZoomScale:0.75f];
        [photoCropper setMaxZoomScale:1.50f];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:photoCropper];
        [self presentViewController:nc animated:YES completion:nil];
        
        
    }];
    
    
    
    
    
}
#pragma mark crop delegate methods

- (void) photoCropper:(SSPhotoCropperViewController *)photoCropper
         didCropPhoto:(UIImage *)photo
{
    [[AppController sharedInstance] setSelectedImage:photo];
    
    
   // self.photoPreviewImageView.image = photo;
    [photoCropper dismissModalViewControllerAnimated:YES];
    
    UploadPhotoViewController* viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"uploadPhotoView"];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void) photoCropperDidCancel:(SSPhotoCropperViewController *)photoCropper
{
    [photoCropper dismissModalViewControllerAnimated:YES];
}

@end
