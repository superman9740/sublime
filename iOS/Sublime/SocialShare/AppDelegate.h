//
//  AppDelegate.h
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/9/13.
//
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>



@class ViewController;
@class UICustomTabbarController;
@class LoginViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSNotificationCenter *notifyCenter;
    
    UICustomTabbarController * tabController;
    LoginViewController* loginViewController;
    
    // For Strings of interfaces
	NSMutableDictionary * stringDicData;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

- (void) getAllStrings;
- (NSString *) getStringWithScreenName:(NSString *)screenName withStringID:(NSString *)strID;

- (NSString *) getResourcePathWithFilename:(NSString *) filename withExt:(NSString *)ext;
- (NSString *) getResourcePathWithFilename:(NSString *) filename;
- (NSString *) getDocumentPathWithFilename:(NSString *) filename withExt:(NSString *)ext;
- (NSString *) getDocumentPathWithFilename:(NSString *) filename;

@end
