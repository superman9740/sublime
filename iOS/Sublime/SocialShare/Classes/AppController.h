//
//  AppController.h
//  sublime
//
//  Created by Shane Dickson on 3/9/14.
//
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppController : NSObject
{
    
    
}

@property (nonatomic, strong) FBProfilePictureView* profilePictureView;

@property (assign) BOOL  isLoggedIn;

@property (nonatomic, strong) NSString* fbAccessToken;


+ (id)sharedInstance;

@end
