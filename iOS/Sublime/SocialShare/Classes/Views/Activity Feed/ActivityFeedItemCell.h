//
//  ActivityFeedItemCell.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperTableCell.h"

@interface ActivityFeedItemCell : SuperTableCell {
    IBOutlet UIImageView * imgvwPersonPhoto;
    IBOutlet UIImageView * imgvwPhoto;
    
    IBOutlet UILabel * lblPersonName;
    IBOutlet UILabel * lblDesc;
    IBOutlet UILabel * lblTime;
}


- (void) setCellContentWith:(NSString *)personPhoto
                       name:(NSString *)name
                       desc:(NSString *)desc
                        hrs:(int)hrs
                      photo:(NSString *)photo;
@end
