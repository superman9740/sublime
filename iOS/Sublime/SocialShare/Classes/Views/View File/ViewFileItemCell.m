//
//  ViewFileItemCell.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ViewFileItemCell.h"

@implementation ViewFileItemCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setCellContentWith:(NSString *)personPhoto
                       name:(NSString *)name
                       desc:(NSString *)desc
{
    [imgvwPersonPhoto setImage:[UIImage imageWithContentsOfFile:personPhoto]];
    
    [lblPersonName setText:name];
    [lblDesc setText:desc];
}

@end
