//
//  ExploreVideoItemCell.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperTableCell.h"
#import "ExploreVideoItemView.h"

@protocol ExploreVideoItemCellDelegate;
@interface ExploreVideoItemCell : SuperTableCell<ExploreVideoItemViewDelegate> {
    IBOutlet UILabel * lblTitle;
    IBOutlet UIScrollView * scrollview;
    
    NSMutableArray * arrPhotoFrames;
}
@property( nonatomic, assign ) id<ExploreVideoItemCellDelegate> delegate;

- (void) setCellContentWith:(NSString *)title photos:(NSArray *)photos;

@end


@protocol ExploreVideoItemCellDelegate

@required

- (void) willPlayVideoFrom:(ExploreVideoItemCell *)evic index:(int)index;

@end
