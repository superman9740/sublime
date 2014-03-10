//
//  ActivityFeedItemCell.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ActivityFeedItemCell.h"

@implementation ActivityFeedItemCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setCellContentWith:(NSString *)personPhoto
                       name:(NSString *)name
                       desc:(NSString *)desc
                        hrs:(int)hrs
                      photo:(NSString *)photo
{
    [imgvwPersonPhoto setImage:[UIImage imageWithContentsOfFile:personPhoto]];
    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:photo]];
    
    [lblPersonName setText:name];
    [lblDesc setText:desc];
    [lblTime setText: (hrs > 1) ? [NSString stringWithFormat:@"%d hours ago", hrs] : [NSString stringWithFormat:@"%d hour ago", hrs]];
}

@end
