//
//  CustomNavViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavViewController.h"


@implementation CustomNavViewController

@synthesize navBarView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navBarView = (CustomNavigationBarView *)[[CustomNavigationBarView alloc] viewFromStoryboard];
	[self.navBarView setFrame:CGRectMake( 0, 0, 320, 64 )];
}



// Override to allow orientations other than the default portrait orientation.
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (( interfaceOrientation == UIInterfaceOrientationPortrait ) || 
            ( interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ));
}
 */



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}



- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



#pragma mark Set navigationBar
- (void) insertNavBarWithScreenName:(NSString *)screen
{
    self.navBarView.delegate = self;
	[self setContentWithDicName:screen];
	[self.view addSubview:self.navBarView];
}


- (void) setContentWithDicName:(NSString *)dicName
{
	if ([dicName isEqualToString:STRDIC_NEWSFEED]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_NEWSFEED withStringID:STRID_NEWSFEED_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
        [self.navBarView.leftButton setHidden:YES];
        
	}
    else if ([dicName isEqualToString:STRDIC_ACTIVITYFEED]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_ACTIVITYFEED withStringID:STRID_ACTIVITYFEED_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
        [self.navBarView.leftButton setHidden:YES];
    }
    else if ([dicName isEqualToString:STRDIC_POSTNEW]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_POSTNEW withStringID:STRID_POSTNEW_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
        [self.navBarView.leftButton setHidden:YES];
    }
    else if ([dicName isEqualToString:STRDIC_EXPLORE]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_EXPLORE withStringID:STRID_EXPLORE_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
        [self.navBarView.leftButton setHidden:YES];
    }
    else if ([dicName isEqualToString:STRDIC_VIEWFILE]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_VIEWFILE withStringID:STRID_VIEWFILE_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
        [self.navBarView.leftButton setHidden:YES];
	}
    else if ([dicName isEqualToString:STRDIC_ELEMENTS]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_ELEMENTS withStringID:STRID_ELEMENTS_NAVTITLE]];
		[self.navBarView.rightButton setHidden:YES];
	}
}

- (void) resetElementsForMode:(BOOL)isPortrait {
    if (isPortrait) {
    }
    else {
    }
}

@end
