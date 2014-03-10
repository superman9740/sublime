//
//  NewsFeedViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"
#import "NewsFeedCell.h"
#import "AppController.h"
#import "LoginViewController.h"

@interface NewsFeedViewController : CustomNavViewController<NewsFeedCellDelegate> {
    IBOutlet UIImageView * imgvwProfile;
    IBOutlet UILabel * lblPhotoCount;
    IBOutlet UILabel * lblvideoCount;
    IBOutlet UILabel * lblLikeCount;
    
    IBOutlet UITableView * tblList;
    
    
    // Temporary Data
    NSMutableArray * arrItems;
}

@end
