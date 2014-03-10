//
//  SuperViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperViewController.h"


@implementation SuperViewController


- (SuperViewController *) viewFromStoryboard
{
    NSLog(@"%@", NSStringFromClass([self class]));
    
    return [SuperViewController viewFromStoryboard:NSStringFromClass([self class])];
}

+ (SuperViewController *) viewFromStoryboard:(NSString *)storyboardID
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
	
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self resize];
}

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


- (void) resize
{
    CGRect frm = self.view.frame;
    frm.origin.y = 0;
    [self.view setFrame:frm];
}



- (void) showAlertWithTitle:(NSString *)title
				message:(NSString *)message
			   receiver:(id)receiver
	  cancelButtonTitle:(NSString *)cancelButtonTitle 
		   otherButtons:(NSArray *)titles
{
	UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:title 
														 message:message 
														delegate:receiver 
											   cancelButtonTitle:cancelButtonTitle 
											   otherButtonTitles:nil];
	if (titles) {
		for (int i = 0; i < [titles count]; i++) {
			[alertview addButtonWithTitle:[titles objectAtIndex:i]];
		}
	}
	
	[alertview show];
}

@end
