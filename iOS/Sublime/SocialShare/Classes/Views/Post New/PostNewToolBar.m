//
//  PostNewToolBar.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "PostNewToolBar.h"

@implementation PostNewToolBar


-(IBAction) toolbar_button_Click:(id)sender
{
    if (self.delegate) {
        if ([sender isEqual:btnCamera]) {
            [self.delegate didToolbarCameraButtonClick:self];
        }
        else if ([sender isEqual:btnBright]) {
            [self.delegate didToolbarBrightButtonClick:self];
        }
        else if ([sender isEqual:btnContrast]) {
            [self.delegate didToolbarContrastButtonClick:self];
        }
        else if ([sender isEqual:btnPin]) {
            [self.delegate didToolbarPinButtonClick:self];
        }
    };
}

@end
