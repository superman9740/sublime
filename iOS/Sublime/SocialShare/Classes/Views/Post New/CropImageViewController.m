//
//  CropImageViewController.m
//  sublime
//
//  Created by Shane Dickson on 3/10/14.
//
//

#import "CropImageViewController.h"

@implementation CropImageViewController

    
    
-(void)viewDidLoad
{
    
    UIImage* image = [[AppController sharedInstance] selectedImage];
    _imageView.image = image;
    
    
}
@end
