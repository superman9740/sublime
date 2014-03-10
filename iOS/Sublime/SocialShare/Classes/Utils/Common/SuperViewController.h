//
//  SuperViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Global.h"

@interface SuperViewController : UIViewController<UIAlertViewDelegate> {
}

@property (nonatomic, assign) AppDelegate * appDelegate;

- (SuperViewController *) viewFromStoryboard;
+ (SuperViewController *) viewFromStoryboard:(NSString *)storyboardID;

- (void) resize;

- (void) showAlertWithTitle:(NSString *)title 
				message:(NSString *)message 
			   receiver:(id)receiver 
	  cancelButtonTitle:(NSString *)cancelButtonTitle 
		   otherButtons:(NSArray *)titles;

@end
