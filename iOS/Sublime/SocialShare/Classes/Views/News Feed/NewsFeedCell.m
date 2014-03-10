//
//  NewsFeedCell.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "NewsFeedCell.h"

@implementation NewsFeedCell




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setCellContentWith:(NSString *)title
                       desc:(NSString *)desc
                      photo:(NSString *)photo
                         dt:(NSString *)dt
                    speechs:(int)speeches
                    isvideo:(BOOL)isvideo
{
    [btnPlay setHidden:!isvideo];
    
    [lblTitle setText:title];
    [lblDesc setText:desc];
    [lblDate setText:dt];
    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:photo]];
    [lblSpeechCount setText:[NSString stringWithFormat:@"%d", speeches]];
    [imgvwCategoryIcon setImage:[UIImage imageNamed:(isvideo) ? @"newsfeed-cell-videoicon.png" : @"newsfeed-cell-photoicon.png"]];
}


-(IBAction) button_Click:(id)sender
{
    if (self.delegate) {
        if ([sender isEqual:btnPlay]) {
            [self.delegate willPlayVideo:self];
        }
        else if ([sender isEqual:btnSpeech]) {
            [self.delegate willViewSpeechs:self];
        }
        else if ([sender isEqual:btnHand]) {
            [self.delegate willAddLike:self];
        }
    }
}


@end
