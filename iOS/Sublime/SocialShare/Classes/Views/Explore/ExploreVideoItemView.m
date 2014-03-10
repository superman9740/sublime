//
//  ExploreVideoItemView.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ExploreVideoItemView.h"

@implementation ExploreVideoItemView
//@synthesize delegate;
//
//+(id) viewFromNib
//{
//    ExploreVideoItemView * eviv = [SuperView viewFromNib:@"ExploreVideoItemView"];
//    
//    [eviv registerTapGesture];
//    
//    return eviv;
//}

- (void) registerTapGesture
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPiece:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
}

- (void) setPhoto:(NSString *)photo
{
    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:photo]];
//    [btnPhoto setImage:[UIImage imageWithContentsOfFile:photo] forState:UIControlStateNormal];
}

//-(IBAction) btnPhoto_Click:(id)sender
//{
//    if (self.delegate) {
//        [self.delegate willPlayVideo:self];
//    }
//}

- (void) tapPiece:(UITapGestureRecognizer *)gestureRecognizer {
    if (self.delegate) {
        [self.delegate willPlayVideo:self];
    }
}



@end
