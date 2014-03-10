//
//  AppDelegate.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/9/13.
//
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "UICustomTabbarController.h"
#import "NewsFeedViewController.h"
#import "AppController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [FBLoginView class];
    [FBProfilePictureView class];
    
    [AppController sharedInstance];
    

    gScreenSize = self.window.frame.size;;
    
    notifyCenter = [NSNotificationCenter defaultCenter];
	[notifyCenter addObserver:self selector:@selector(trackNotifications:) name:nil object:nil];
    
    [self getAllStrings];
    
    tabController = (UICustomTabbarController *)[[UICustomTabbarController alloc] viewFromStoryboard];
    
    [self.window makeKeyAndVisible];;
    
    
    
    self.window.rootViewController = tabController;
    
    return YES;
}


- (BOOL)application:(UIApplication *)application    openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication       annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void) trackNotifications: (NSNotification *) notification
{
	id nname = [notification name];
	id object = [notification object];
	
	if ([nname isEqual:@"gotoHomeView"]) {		//move to Starting View from Loading View
        if ([object isEqual:@"SplashView"]) {
			self.window.rootViewController = tabController;
		}
    }
}



#pragma GET REAL PATH OF FILE
/*================================================================================
 *
 *	Get resource path
 * ---------------------
 *
 *	@description:
 *		Get Resource path of file
 *
 *	@parameters:
 *		NSString * filename : file name
 *		NSString * ext		: extension of file
 *
 *	@return: NSString *
 *		resource path string
 *
 ==================================================================================*/
- (NSString *) getResourcePathWithFilename:(NSString *) filename withExt:(NSString *)ext
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:ext];
	
	return [filePath copy];
}



/*================================================================================
 *
 *	Get resource path
 * ---------------------
 *
 *	@description:
 *		Get Resource path of file
 *
 *	@parameters:
 *		NSString * filename : file name ( including extension )
 *
 *	@return: NSString *
 *		resource path string
 *
 ==================================================================================*/
- (NSString *) getResourcePathWithFilename:(NSString *) filename
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
	
	return [filePath copy];
}



/*================================================================================
 *
 *	Get document path
 * ---------------------
 *
 *	@description:
 *		Get document path of file
 *
 *	@parameters:
 *		NSString * filename : file name
 *		NSString * ext		: extension of file
 *
 *	@return: NSString *
 *		document path string
 *
 ==================================================================================*/
- (NSString *) getDocumentPathWithFilename:(NSString *) filename withExt:(NSString *)ext
{
	NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *rootPath = (NSString*)[pathArray objectAtIndex:0];
	NSString *filePath = [rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", filename, ext]];
	
	return [filePath copy];
}



/*================================================================================
 *
 *	Get document path
 * ---------------------
 *
 *	@description:
 *		Get document path of file
 *
 *	@parameters:
 *		NSString * filename : file name ( including extension )
 *
 *	@return: NSString *
 *		document path string
 *
 ==================================================================================*/
- (NSString *) getDocumentPathWithFilename:(NSString *) filename
{
	NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *rootPath = (NSString*)[pathArray objectAtIndex:0];
	NSString *filePath = [rootPath stringByAppendingPathComponent:filename];
	
	return [filePath copy];
}


#pragma mark Get String data
/*================================================================================
 *
 *	Get strings
 * ----------------------------------
 *
 *	@description:
 *		Get all strings from dic file
 *
 *	@return: none
 *
 ==================================================================================*/
- (void) getAllStrings
{
	// Load stringDic data
	NSString * realFileName = [NSString stringWithFormat:@"%@", @"strings"];
	stringDicData = [[NSMutableDictionary alloc] initWithContentsOfFile:[self getResourcePathWithFilename:realFileName withExt:@"plist"]];
}



/*================================================================================
 *
 *	Get string
 * ----------------------------------
 *
 *	@description:
 *		Get string of specified id, specified screen
 *
 *	@parameters:
 *		NSString * screenName : screen ID
 *		NSString * strID	  : string ID
 *
 *	@return: NSString *
 *		string
 *
 ==================================================================================*/
- (NSString *) getStringWithScreenName:(NSString *)screenName withStringID:(NSString *)strID
{
	NSString * value = @"";
	
	if (stringDicData != nil) {
		NSMutableDictionary * dicForScreen = [stringDicData objectForKey:screenName];
		
		value = [[dicForScreen objectForKey:strID] copy];
	}
	
	return value;
}

@end
