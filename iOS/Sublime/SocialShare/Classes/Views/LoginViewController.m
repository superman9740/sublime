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

-(IBAction)registerWithEmail
{
    
    if([_email.text isEqualToString:@""])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Validation error" message:@"Please enter an email and password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
        
        
    }
    [[AppController sharedInstance] registerNewUser:_email.text password:_password.text];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_email.text forKey:@"userEmail"];
    
    [defaults synchronize];
    
    
    
    [self dismissViewControllerAnimated:NO completion:nil];

    
    
    
    
}
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView        user:(id<FBGraphUser>)user {
    [[[AppController sharedInstance] profilePictureView] setProfileID:user.id];
    
    BOOL isLoggedIn = [[AppController sharedInstance] isLoggedIn];
    NSString* facebookEmail = [user objectForKey:@"email"];
    
    if(!isLoggedIn)
    {
    
        [[AppController sharedInstance] registerNewUser:facebookEmail password:@""];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:_email.text forKey:@"userEmail"];
        
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
    
    if([_email.text isEqualToString:@""])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Validation error" message:@"Please enter an email and password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
        
        
    }
    NSString* retVal = [[AppController sharedInstance] userLogin:_email.text password:_password.text];
    
    if([retVal isEqualToString:@"1"])
    {
   
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:_email.text forKey:@"userEmail"];
        
        [defaults synchronize];
        
        
    
    }
    else
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Validation error" message:@"Your User ID and/or password were incorrect." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
 
        
    }
    
    
    
   
    
}


@end
