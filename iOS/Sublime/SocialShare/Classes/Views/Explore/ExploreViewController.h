//
//  ExploreViewController.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavViewController.h"
#import "UICustomSearchBar.h"
#import "ExploreVideoItemCell.h"

@interface ExploreViewController : CustomNavViewController<UICustomSearchBarDelegate, ExploreVideoItemCellDelegate> {
    UICustomSearchBar * searchBar;
    
    IBOutlet UITableView * tablePhotos;
    
    
    // Temporary
    NSMutableArray * arrItems;
}

@end
