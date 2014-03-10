//
//  ExploreVideoItemCell.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ExploreVideoItemCell.h"

@implementation ExploreVideoItemCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setCellContentWith:(NSString *)title photos:(NSArray *)photos
{
    [lblTitle setText:title];
    
    if (arrPhotoFrames) {
        
        for ( int i = 0; i < [arrPhotoFrames count]; i++) {
            ExploreVideoItemView * eviv = [arrPhotoFrames objectAtIndex:i];
            [eviv removeFromSuperview];
        }
        
        [arrPhotoFrames removeAllObjects];
    }
    
    
    if (photos == nil) return;
    
    
    int x = 0;
    for (int i = 0; i < [photos count]; i++) {
        ExploreVideoItemView * eviv = (ExploreVideoItemView *)[[ExploreVideoItemView alloc] viewFromStoryboard];
        eviv.delegate = self;
        [eviv registerTapGesture];
        [eviv setFrame:CGRectMake( x, 0, 128, 87 )];
        [eviv setPhoto:[photos objectAtIndex:i]];
        [arrPhotoFrames addObject:eviv];
        [scrollview addSubview:eviv];
        
        x += 128 + 5;
    }
    [scrollview setContentSize:CGSizeMake( x, 92 )];
}



#pragma mark --
#pragma mark -- ExploreVideoItemViewDelegate --
- (void) willPlayVideo:(ExploreVideoItemView *)eviv
{
    if (self.delegate) {
        [self.delegate willPlayVideoFrom:self index:[arrPhotoFrames indexOfObject:eviv]];
    }
}

@end
