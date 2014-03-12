//
//  LoginViewController.m
//  Sublime
//
//  Created by Shane Dickson on 3/9/14.
//  Copyright (c) 2014 Cristian Ronaldo. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
   // [[[FBSession activeSession] accessTokenData] accessToken];
    
    
}
-(IBAction)loginWithFacebook
{
 
   
    
    
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView        user:(id<FBGraphUser>)user {
    [[[AppController sharedInstance] profilePictureView] setProfileID:user.id];
    
    BOOL isLoggedIn = [[AppController sharedInstance] isLoggedIn];
    if(!isLoggedIn)
    {
    
        NSString* token =  [[[FBSession activeSession] accessTokenData] accessToken];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:token forKey:@"facebookToken"];
        
        [defaults synchronize];
        
        
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
        
    }
    else
    {
        
      //  [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoHomeView" object:@"SplashView"];
   
        
    }
    
    
    //self.nameLabel.text = user.name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


-(IBAction)loginWithGoogle
{
    
}
-(IBAction)loginWithEmail
{
    
    
}
-(IBAction)registerWithEmail
{
    
    
}


@end
