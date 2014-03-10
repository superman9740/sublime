//
//  ViewFileViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"

@interface ViewFileViewController : CustomNavViewController {
    
    IBOutlet UIImageView * imgvwPhoto;
    
    // Profile
    IBOutlet UIImageView * imgvwPerson;
    IBOutlet UILabel * lblCommentCount;
    IBOutlet UILabel * lblLikeCount;
    IBOutlet UILabel * lblTitle;
    IBOutlet UILabel * lblDesc;
    IBOutlet UILabel * lblTime;
    
    IBOutlet UIButton * btnLike;
    IBOutlet UIButton * btnComment;
    
    
    IBOutlet UITableView * tableList;
    
    
    // Temporary
    NSMutableArray * arrItems;
}



@end
