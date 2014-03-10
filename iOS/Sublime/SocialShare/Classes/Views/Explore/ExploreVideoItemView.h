//
//  ExploreVideoItemView.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SuperView.h"

@protocol ExploreVideoItemViewDelegate;

@interface ExploreVideoItemView : SuperView<UIGestureRecognizerDelegate> {
    IBOutlet UIImageView * imgvwPhoto;
}
@property (nonatomic, assign)id<ExploreVideoItemViewDelegate> delegate;

- (void) registerTapGesture;
- (void) setPhoto:(NSString *)photo;

@end


@protocol ExploreVideoItemViewDelegate

@required

- (void) willPlayVideo:(ExploreVideoItemView *)eviv;

@end