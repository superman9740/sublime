//
//  LoginViewController.h
//  Sublime
//
//  Created by Shane Dickson on 3/9/14.
//  Copyright (c) 2014 Cristian Ronaldo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "AppController.h"

@interface LoginViewController : UIViewController<FBLoginViewDelegate>
{
    
    
}


@property (strong,nonatomic) IBOutlet UITextField* email;
@property (strong,nonatomic) IBOutlet UITextField* password;

-(IBAction)loginWithFacebook;
-(IBAction)loginWithGoogle;
-(IBAction)loginWithEmail;
-(IBAction)registerWithEmail;



@end
