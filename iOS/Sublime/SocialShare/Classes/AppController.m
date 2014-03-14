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
        _userEmail = [defaults objectForKey:@"userEmail"];
        if(_userEmail == nil)
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
-(NSString*)userLogin:(NSString*)email password:(NSString*)password
{
    
    NSString* urlString = [NSString stringWithFormat:@"http://173.255.223.103:8080/Sublime/UserLogin?email=%@&password=%@",email, password];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSError* error = nil;
    NSURLResponse* response = nil;
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(error.code == -1004)
    {
        
        /*
         UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Service Error" message:@"There was an error connecting to the server.  Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [alertView show];
         return;
         */
    }
    NSString* returnString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return returnString;
    
    
}

-(void)registerNewUser:(NSString*)email password:(NSString*)password
{
    
    NSString* urlString = [NSString stringWithFormat:@"http://173.255.223.103:8080/Sublime/RegisterNewUser?email=%@&password=%@",email, password];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSError* error = nil;
    NSURLResponse* response = nil;
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(error.code == -1004)
    {
        
        /*
         UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Service Error" message:@"There was an error connecting to the server.  Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [alertView show];
         return;
         */
    }
    NSString* returnString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  
    _userEmail = email;
    self.isLoggedIn = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoHomeView" object:@"SplashView"];
    
    
/*
    if([returnString isEqualToString:@"-1\n"])
    {
        return;
        
    }
    NSArray* dictArray =  [NSJSONSerialization JSONObjectWithData: jsonData  options: NSJSONReadingAllowFragments   error: &error];
    
    
    for (NSDictionary* dict in dictArray)
    {
        
        NSDictionary* timeDict = [dict objectForKey:@"createdTimestamp"];
        NSString* timeVal = [timeDict valueForKey:@"time"];
        if([timeVal class] == [NSNull class])
        {
            continue;
            
        }
        NSTimeInterval intervaldep=timeVal.doubleValue/1000;
        
        NSDate* dateObj = [NSDate dateWithTimeIntervalSince1970:intervaldep];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM-dd-yyyy hh:mm:ss"];
        
        //Optionally for time zone converstions
        //[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
        
        NSString *stringFromDate = [formatter stringFromDate:dateObj];
        
        
        
        NSString* notes = [dict valueForKey:@"notes"];
        ServiceCallHistory* serviceCallHistoryObject = [[ServiceCallHistory alloc] init];
        serviceCallHistoryObject.date = stringFromDate;
        serviceCallHistoryObject.notes = notes;
        [[[AppController sharedInstance] serviceCallHistory] addObject:serviceCallHistoryObject];
        
        
    }
    
    
  */
    
    
    
}


@end
