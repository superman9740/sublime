//
//  ViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/9/13.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [loadingView startAnimating];
    
    [loadingView setCenter:CGPointMake( gScreenSize.width / 2, gScreenSize.height / 2)];
    
	[NSThread detachNewThreadSelector:@selector(tryToLoad) toTarget:self withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tryToLoad
{
	@autoreleasepool {
        sleep(1);
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoHomeView" object:@"SplashView"];
        [loadingView stopAnimating];
    }
}


@end
