//
//  ActivityFeedViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"

@interface ActivityFeedViewController : CustomNavViewController {
    IBOutlet UISegmentedControl * segOptions;
    
    IBOutlet UITableView *tblList;
    
    // Temporary Data
    NSMutableArray * arrItems;
}

@end
