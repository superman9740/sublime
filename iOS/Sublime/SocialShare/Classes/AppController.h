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
@property (nonatomic, strong) NSString* userEmail;

@property (nonatomic, strong) UIImage*  selectedImage;
@property (nonatomic, strong) UIImage*  userProfilePhoto;
@property (nonatomic, strong) NSMutableArray*  uploadedPhotos;




+ (id)sharedInstance;
-(void)registerNewUser:(NSString*)email password:(NSString*)password;
-(NSString*)userLogin:(NSString*)email password:(NSString*)password;

@end
