//
//  SuperTableCell.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/29/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "SuperTableCell.h"


@implementation SuperTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}



+ (float) getRealWidthFrom:(float)height content:(NSString *)content fontname:(NSString *)fontname fontsize:(float)fontsize
{
	UIFont *textFont = [UIFont fontWithName:fontname size:fontsize];
	
	
	return [SuperTableCell getRealWidthFrom:height content:content font:textFont];
}



+ (float) getRealWidthFrom:(float)height content:(NSString *)content font:(UIFont *)font
{
	CGSize size = CGSizeMake(320, height);
	CGSize textSize = [SuperTableCell text:content
                              sizeWithFont:font
                         constrainedToSize:size];
    
	return textSize.width;
}


+ (float) getRealHeightFrom:(float)width content:(NSString *)content fontname:(NSString *)fontname fontsize:(float)fontsize
{
	UIFont *textFont = [UIFont fontWithName:fontname size:fontsize];
	
	return [SuperTableCell getRealHeightFrom:width content:content font:textFont];
}


+ (float) getRealHeightFrom:(float)width content:(NSString *)content font:(UIFont *)font
{
    CGSize size = CGSizeMake(width, 1000);
    CGSize textSize = [SuperTableCell text:content
                              sizeWithFont:font
                         constrainedToSize:size];
	
	return textSize.height;
}


+ (CGSize)text:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    
    CGRect frame = [text boundingRectWithSize:size
                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:attributesDictionary
                                      context:nil];
    
    return frame.size;
}


@end
