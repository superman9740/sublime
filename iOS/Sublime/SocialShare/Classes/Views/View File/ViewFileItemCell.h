//
//  ViewFileItemCell.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperTableCell.h"

@interface ViewFileItemCell : SuperTableCell {
    IBOutlet UIImageView * imgvwPersonPhoto;
    
    IBOutlet UILabel * lblPersonName;
    IBOutlet UILabel * lblDesc;
}


- (void) setCellContentWith:(NSString *)personPhoto
                       name:(NSString *)name
                       desc:(NSString *)desc;
@end
