//
//  UploadPhotoViewController.m
//  sublime
//
//  Created by sdickson on 3/11/14.
//
//

#import "UploadPhotoViewController.h"

@interface UploadPhotoViewController ()

@end

@implementation UploadPhotoViewController

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
    self.imageView.image = [[AppController sharedInstance] selectedImage];
    
}


-(IBAction)uploadPhoto:(id)sender
{
    [[[AppController sharedInstance] uploadedPhotos] addObject:self.imageView.image];
    
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Upload" message:@"Your photo is on its way!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
