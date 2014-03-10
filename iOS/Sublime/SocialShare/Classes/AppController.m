//
//  AppController.m
//  sublime
//
//  Created by Shane Dickson on 3/9/14.
//
//

#import "AppController.h"

static  AppController* sharedInstance = nil;


@implementation AppController


+ (AppController *)sharedInstance {
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];

        
        
    }
    
    return sharedInstance;
}

-(id)init
{
    
    self = [super init];
    if(self)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _fbAccessToken = [defaults objectForKey:@"facebookToken"];
        if(_fbAccessToken == nil)
        {
            self.isLoggedIn = NO;
            
        }
        else
        {
            self.isLoggedIn = YES;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoHomeView" object:@"SplashView"];
            
            
        }
        
    }
    
    return self;
    
}



@end
