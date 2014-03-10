//
//  SuperView.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperView.h"


@implementation SuperView


- (SuperView *) viewFromStoryboard
{
    NSLog(@"%@", NSStringFromClass([self class]));
    
    return [SuperView viewFromStoryboard:NSStringFromClass([self class])];
}


+ (id)viewFromStoryboard:(NSString *)storyboardID
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
	
	SuperView * vw = (SuperView *)(controller.view);
    
	return vw;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void) resize
{
    ;
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
