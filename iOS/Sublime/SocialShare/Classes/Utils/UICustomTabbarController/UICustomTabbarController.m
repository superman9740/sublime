//
//  UICustomTabbarController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/7/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomTabbarController.h"

#import "ActivityFeedViewController.h"
#import "ExploreViewController.h"
#import "NewsFeedViewController.h"
#import "PostNewViewController.h"
#import "ViewFileViewController.h"
#import "UserProfileViewController.h"


@interface UICustomTabbarController ()

@end

@implementation UICustomTabbarController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nibs
    
    // Initialize
    UserProfileViewController* userViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"userProfileView"];
    
    navNewsFeedController = [[UINavigationController alloc] initWithRootViewController:userViewController];
    [navNewsFeedController.view setFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
    [navNewsFeedController setNavigationBarHidden:YES];
    
    ActivityFeedViewController * activityController = (ActivityFeedViewController *)[[ActivityFeedViewController alloc] viewFromStoryboard];
    navActivityController = [[UINavigationController alloc] initWithRootViewController:activityController];
    [navActivityController.view setFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
    [navActivityController setNavigationBarHidden:YES];
    
    PostNewViewController * postController = (PostNewViewController *)[[PostNewViewController alloc] viewFromStoryboard];
    navPostNewController = [[UINavigationController alloc] initWithRootViewController:postController];
    [navPostNewController.view setFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
    [navPostNewController setNavigationBarHidden:YES];
    
    ExploreViewController * explorerController = (ExploreViewController *)[[ExploreViewController alloc] viewFromStoryboard];
    navExploreController = [[UINavigationController alloc] initWithRootViewController:explorerController];
    [navExploreController.view setFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
    [navExploreController setNavigationBarHidden:YES];
    
    ViewFileViewController * viewfileController = (ViewFileViewController *)[[ViewFileViewController alloc] viewFromStoryboard];
    navViewFileController = [[UINavigationController alloc] initWithRootViewController:viewfileController];
    [navViewFileController.view setFrame:CGRectMake( 0, 0, gScreenSize.width, gScreenSize.height )];
    [navViewFileController setNavigationBarHidden:YES];
    
    [self tabbarbutton_Click:btnHome];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) tabbarbutton_Click:(id)sender
{
    if (currentController != nil) {
        [currentController.view removeFromSuperview];
    }
    
    if ([sender isEqual:btnHome]) {
        [btnHome  setImage:[UIImage imageNamed:@"tabbar-home-selected.png"] forState:UIControlStateNormal];
        [btnFavor setImage:[UIImage imageNamed:@"tabbar-favor-normal.png"] forState:UIControlStateNormal];
        [btnCloud setImage:[UIImage imageNamed:@"tabbar-cloud-normal.png"] forState:UIControlStateNormal];
        [btnVideo setImage:[UIImage imageNamed:@"tabbar-video-normal.png"] forState:UIControlStateNormal];
        [btnPhoto setImage:[UIImage imageNamed:@"tabbar-photo-normal.png"] forState:UIControlStateNormal];
        
        currentController = navNewsFeedController;
    }
    else if ([sender isEqual:btnFavor]) {
        [btnHome  setImage:[UIImage imageNamed:@"tabbar-home-normal.png"] forState:UIControlStateNormal];
        [btnFavor setImage:[UIImage imageNamed:@"tabbar-favor-selected.png"] forState:UIControlStateNormal];
        [btnCloud setImage:[UIImage imageNamed:@"tabbar-cloud-normal.png"] forState:UIControlStateNormal];
        [btnVideo setImage:[UIImage imageNamed:@"tabbar-video-normal.png"] forState:UIControlStateNormal];
        [btnPhoto setImage:[UIImage imageNamed:@"tabbar-photo-normal.png"] forState:UIControlStateNormal];
        
        currentController = navActivityController;
    }
    else if ([sender isEqual:btnCloud]) {
        [btnHome  setImage:[UIImage imageNamed:@"tabbar-home-normal.png"] forState:UIControlStateNormal];
        [btnFavor setImage:[UIImage imageNamed:@"tabbar-favor-normal.png"] forState:UIControlStateNormal];
        [btnCloud setImage:[UIImage imageNamed:@"tabbar-cloud-selected.png"] forState:UIControlStateNormal];
        [btnVideo setImage:[UIImage imageNamed:@"tabbar-video-normal.png"] forState:UIControlStateNormal];
        [btnPhoto setImage:[UIImage imageNamed:@"tabbar-photo-normal.png"] forState:UIControlStateNormal];
        
        currentController = navPostNewController;
    }
    else if ([sender isEqual:btnVideo]) {
        [btnHome  setImage:[UIImage imageNamed:@"tabbar-home-normal.png"] forState:UIControlStateNormal];
        [btnFavor setImage:[UIImage imageNamed:@"tabbar-favor-normal.png"] forState:UIControlStateNormal];
        [btnCloud setImage:[UIImage imageNamed:@"tabbar-cloud-normal.png"] forState:UIControlStateNormal];
        [btnVideo setImage:[UIImage imageNamed:@"tabbar-video-selected.png"] forState:UIControlStateNormal];
        [btnPhoto setImage:[UIImage imageNamed:@"tabbar-photo-normal.png"] forState:UIControlStateNormal];
        
        currentController = navExploreController;
    }
    else if ([sender isEqual:btnPhoto]) {
        [btnHome  setImage:[UIImage imageNamed:@"tabbar-home-normal.png"] forState:UIControlStateNormal];
        [btnFavor setImage:[UIImage imageNamed:@"tabbar-favor-normal.png"] forState:UIControlStateNormal];
        [btnCloud setImage:[UIImage imageNamed:@"tabbar-cloud-normal.png"] forState:UIControlStateNormal];
        [btnVideo setImage:[UIImage imageNamed:@"tabbar-video-normal.png"] forState:UIControlStateNormal];
        [btnPhoto setImage:[UIImage imageNamed:@"tabbar-photo-selected.png"] forState:UIControlStateNormal];
        
        currentController = navViewFileController;
    }
    
    [self.view addSubview:currentController.view];
    [self.view bringSubviewToFront:tabbarView];
}

@end
