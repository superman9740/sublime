//
//  NewsFeedCell.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/11/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SuperTableCell.h"

@protocol NewsFeedCellDelegate;

@interface NewsFeedCell : SuperTableCell {
    
    IBOutlet UIImageView * imgvwCategoryIcon;
    
    IBOutlet UIImageView * imgvwPhoto;
    
    IBOutlet UILabel * lblTitle;
    IBOutlet UILabel * lblDesc;
    IBOutlet UILabel * lblDate;
    
    IBOutlet UIButton * btnPlay;
    
    IBOutlet UIButton * btnSpeech;
    IBOutlet UILabel * lblSpeechCount;
    
    IBOutlet UIButton * btnHand;    
}
@property (nonatomic, assign)id<NewsFeedCellDelegate> delegate;


- (void) setCellContentWith:(NSString *)title
                       desc:(NSString *)desc
                      photo:(NSString *)photo
                         dt:(NSString *)dt
                    speechs:(int)speeches
                    isvideo:(BOOL)isvideo;

@end


@protocol NewsFeedCellDelegate

@required

- (void) willPlayVideo:(NewsFeedCell *)nfc;
- (void) willViewSpeechs:(NewsFeedCell *)nfc;
- (void) willAddLike:(NewsFeedCell *)nfc;

@end