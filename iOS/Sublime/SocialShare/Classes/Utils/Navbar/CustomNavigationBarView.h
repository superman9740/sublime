//
//  CustomNavigationBarView.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "SuperView.h"

@protocol CustomNavBarViewDelegate;

@interface CustomNavigationBarView : SuperView {
	IBOutlet UIImageView * bgImageView;
	
	IBOutlet UILabel *lblTitle;
    IBOutlet UIButton * rightButton;
    IBOutlet UIButton * leftButton;
}

@property (nonatomic, assign) id<CustomNavBarViewDelegate> delegate;

@property (nonatomic, retain) IBOutlet UIImageView * bgImageView;
@property (nonatomic, retain) IBOutlet UILabel * lblTitle;
@property (nonatomic, retain) IBOutlet UIButton * rightButton;
@property (nonatomic, retain) IBOutlet UIButton * leftButton;

- (IBAction) navbarButton_Click:(id)sender;

@end




@protocol CustomNavBarViewDelegate <NSObject>

@optional

- (void) didClickNavBarRightButton;
- (void) didClickNavBarLeftButton;

@end