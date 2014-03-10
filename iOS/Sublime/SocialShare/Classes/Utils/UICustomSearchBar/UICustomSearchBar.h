//
//  UICustomSearchBar.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 1/20/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperView.h"

@protocol UICustomSearchBarDelegate;

@interface UICustomSearchBar : SuperView {
	
	IBOutlet UITextField * keywordInputField;
	
	UILabel * placeFolderLabel;
    
    IBOutlet UIImageView *bgImageView;
}

@property (nonatomic, retain) IBOutlet UITextField * keywordInputField;
@property (nonatomic, retain) UILabel * placeFolderLabel;

@property (nonatomic, assign) id<UICustomSearchBarDelegate> delegate;

+(id) viewFromNib;


@end


@protocol UICustomSearchBarDelegate

@optional

- (void) beginInputKeyword:(UICustomSearchBar *)searchBar;
- (void) performSearching:(UICustomSearchBar *)searchBar;

@end