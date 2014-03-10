//
//  ElementsViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"

#import "UICustomProgressBar.h"

#import "UICheckboxButton.h"
#import "UIGroupCheckboxView.h"

@interface ElementsViewController : CustomNavViewController<UIGroupCheckboxViewDelegate> {
    UICustomProgressBar * progressBar;
    
    UIGroupCheckboxView * grpCheckbox;
    UIGroupCheckboxView * grpRadio;
    
    IBOutlet UIButton * btnShare;
}

@end
