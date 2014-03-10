//
//  UICustomSearchBar.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 1/20/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomSearchBar.h"

#import "Global.h"

@implementation UICustomSearchBar

@synthesize keywordInputField;
@synthesize placeFolderLabel;


+ (id)viewFromNib {
    UICustomSearchBar * sb = (UICustomSearchBar *)[[UICustomSearchBar alloc] viewFromStoryboard];
    sb.placeFolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 9, 264, 21)];
    sb.placeFolderLabel.textAlignment = NSTextAlignmentLeft;
    sb.placeFolderLabel.backgroundColor = [UIColor clearColor];
    sb.placeFolderLabel.textColor = [UIColor colorWithRed:147/255.0f green:139/255.0f blue:121/255.0f alpha:1.0f];
    [sb.placeFolderLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
    [sb.placeFolderLabel setText:@"Search users and files"];
    [sb addSubview:sb.placeFolderLabel];
    
    return sb;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	[self.placeFolderLabel setHidden:TRUE];
	
	[self.delegate beginInputKeyword:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * currentString = [[textField text] stringByReplacingCharactersInRange:range withString:string];
	
	[self.placeFolderLabel setHidden:(currentString.length != 0)];
	
	return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[self.placeFolderLabel setHidden:([self.keywordInputField.text length] != 0)];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self.keywordInputField resignFirstResponder];

	// Perform searching
	[self.delegate performSearching:self];
	
	return TRUE;
}

@end
