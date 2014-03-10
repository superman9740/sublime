//
//  PostNewViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "PostNewViewController.h"

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
    
    
    // Set Photo & Content
//    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:@""]];
//    [textView setText:@""];
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
    
    
    [_pickerController dismissViewControllerAnimated:YES completion:nil];
    
    
}


@end
