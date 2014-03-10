//
//  UICustomProgressBar.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomProgressBar : UIView {
    UIImageView * imgFill;
    UIImageView * imgBar;
    UILabel * lblText;
}

- (void) setCurrentPercentWithValue:(float)value;

@end
