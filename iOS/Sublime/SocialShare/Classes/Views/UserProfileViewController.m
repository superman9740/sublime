//
//  UserProfileViewController.m
//  sublime
//
//  Created by Shane Dickson on 3/15/14.
//
//

#import "UserProfileViewController.h"

@implementation UserProfileViewController


-(void)viewDidLoad
{
    CGRect frame = _userProfilePhoto.frame;
    
    _userProfilePhoto.layer.cornerRadius = frame.size.width / 2;
    _userProfilePhoto.layer.masksToBounds = YES;
    currentPageIndex = 0;
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    NSMutableArray* images = [[AppController sharedInstance] uploadedPhotos];
    int xPos = 0;
    
    @autoreleasepool
    {
        for (UIImage* image in images)
        {
            
            
            CGRect frame;
            frame.origin.x = xPos;
            frame.size.height = _scrollView.frame.size.width;
            frame.size.width = _scrollView.frame.size.height;
            
            UIImageView* subview = [[UIImageView alloc] initWithFrame:frame];
            subview.contentMode = UIViewContentModeScaleToFill;
            
            subview.image = image;
            
            [self.scrollView addSubview:subview];
            xPos += _scrollView.frame.size.width;
            
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * [images count], self.scrollView.frame.size.height);
   // [self.thumbnailView setContentOffset:CGPointMake(0, 0)];

    
    
    
    
}
-(IBAction)changeUserProfilePhoto:(id)sender
{
    _pickerController = [[UIImagePickerController alloc] init];
    _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    _pickerController.mediaTypes =     [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    _pickerController.allowsEditing = NO;
    _pickerController.delegate = self;
    
    [self presentViewController:_pickerController animated:YES completion:nil];
    
    
    
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
        
    }
    
    _userProfilePhoto.image = originalImage;
    
 /*
    
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
    
   */
    
    
    
    
    [_pickerController dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
    
    
    
    
    
}
#pragma mark scroll delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGPoint currentOffset = scrollView.contentOffset;
    int currentXPosition = currentOffset.x;
    int scrollViewWidth = _scrollView.frame.size.width;
    currentPageIndex = currentXPosition / scrollViewWidth;
    NSLog(@"Current offset is:  %df, page is:  %df, scrollViewWidth is:  %df", currentXPosition,currentPageIndex,scrollViewWidth);
    
    
    
    
}

#pragma mark left/right scrolling
-(IBAction)performScrollLeft:(id)sender
{
    if(currentPageIndex == 0)
        return;
     int scrollViewWidth = _scrollView.contentOffset.x;
    int newXPos = scrollViewWidth - 256;
    [_scrollView scrollRectToVisible:CGRectMake(newXPos, 0, 256 , 256) animated:YES];

    
}
-(IBAction)performScrollRight:(id)sender
{
    

    int scrollViewWidth = _scrollView.contentOffset.x;
    int newXPos = scrollViewWidth + 256;
    [_scrollView scrollRectToVisible:CGRectMake(newXPos, 0, 256 , 256) animated:YES];

    
}



@end
