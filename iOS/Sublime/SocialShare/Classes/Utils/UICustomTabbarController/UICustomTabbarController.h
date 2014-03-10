//
//  UICustomTabbarController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/7/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SuperViewController.h"

@interface UICustomTabbarController : SuperViewController {
    
    IBOutlet UIButton * btnHome;
    IBOutlet UIButton * btnFavor;
    IBOutlet UIButton * btnCloud;
    IBOutlet UIButton * btnVideo;
    IBOutlet UIButton * btnPhoto;
    
    UINavigationController * navNewsFeedController;
    UINavigationController * navActivityController;
    UINavigationController * navPostNewController;
    UINavigationController * navExploreController;
    UINavigationController * navViewFileController;
    
    UIViewController * currentController;
    
    IBOutlet UIView * tabbarView;
}

- (IBAction) tabbarbutton_Click:(id)sender;

@end
