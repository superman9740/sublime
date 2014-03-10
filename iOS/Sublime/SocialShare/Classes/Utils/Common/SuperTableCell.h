//
//  SuperTableCell.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 9/29/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SuperTableCell : UITableViewCell {
	;
}

+ (float) getRealWidthFrom:(float)height content:(NSString *)content fontname:(NSString *)fontname fontsize:(float)fontsize;
+ (float) getRealHeightFrom:(float)width content:(NSString *)content fontname:(NSString *)fontname fontsize:(float)fontsize;

@end
