//
//  PostNewToolBar.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SuperView.h"

@protocol PostNewToolBarDelegate;
@interface PostNewToolBar : SuperView {
    
    IBOutlet UIButton * btnCamera;
    IBOutlet UIButton * btnBright;
    IBOutlet UIButton * btnContrast;
    IBOutlet UIButton * btnPin;
}
@property (nonatomic, assign)id<PostNewToolBarDelegate> delegate;

-(IBAction) toolbar_button_Click:(id)sender;

@end


@protocol PostNewToolBarDelegate

@required

- (void) didToolbarCameraButtonClick:(PostNewToolBar *)pntb;
- (void) didToolbarBrightButtonClick:(PostNewToolBar *)pntb;
- (void) didToolbarContrastButtonClick:(PostNewToolBar *)pntb;
- (void) didToolbarPinButtonClick:(PostNewToolBar *)pntb;

@end