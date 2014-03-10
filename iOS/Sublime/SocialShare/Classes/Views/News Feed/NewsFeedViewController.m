//
//  NewsFeedViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "ElementsViewController.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self insertNavBarWithScreenName:STRDIC_NEWSFEED];
    

    int photoCount = 214;
    [lblPhotoCount setText:[NSString stringWithFormat:@"%d", photoCount ]];
    
    int videoCount = 814;
    [lblvideoCount setText:[NSString stringWithFormat:@"%d", videoCount ]];
    
    int likesCount = 7814;
    [lblLikeCount setText:[NSString stringWithFormat:@"%d", likesCount ]];
    
   // FBProfilePictureView* view  = [[AppController sharedInstance] profilePictureView];
/*
    for (NSObject *obj in [view subviews]) {
        if ([obj isMemberOfClass:[UIImageView class]]) {
            UIImageView *objImg = (UIImageView *)obj;
            imgvwProfile = objImg;
            
            break;
        }
    }
    
  */
    
    
    // Temporary Data
    NSString * photo = [self.appDelegate getResourcePathWithFilename:@"newsfeed-cell-photoicon.png"];
    
    arrItems = [[NSMutableArray alloc] init];
    [arrItems addObject:[NSArray arrayWithObjects:
                         @"Stalking",
                         @"how is winter season treating you?",
                         photo,
                         @"17.02.2013",
                         [NSNumber numberWithInt:5],
                         [NSNumber numberWithInt:false],
                         nil]];
    [arrItems addObject:[NSArray arrayWithObjects:
                         @"Stalking",
                         @"how is winter season treating you?",
                         photo, @"17.02.2013",
                         [NSNumber numberWithInt:32],
                         [NSNumber numberWithInt:true],
                         nil]];
    [arrItems addObject:[NSArray arrayWithObjects:
                         @"Stalking",
                         @"how is winter season treating you?",
                         photo,
                         @"17.02.2013",
                         [NSNumber numberWithInt:15],
                         [NSNumber numberWithInt:false],
                         nil]];
    if([[AppController sharedInstance] isLoggedIn] == NO)
    {
        
        LoginViewController* loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
        
        
        [self presentViewController:loginViewController animated:NO completion:nil];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --
#pragma mark -- UITableViewDelegate Method --
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 138;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int cellRow = [indexPath row];
    
	UITableViewCell * cell = nil;
    NSString *cellid = @"NewsFeedCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[NewsFeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSArray * arr = [arrItems objectAtIndex:cellRow];
    
    [(NewsFeedCell *)cell setCellContentWith:[arr objectAtIndex:0]
                                        desc:[arr objectAtIndex:1]
                                       photo:[arr objectAtIndex:2]
                                          dt:[arr objectAtIndex:3]
                                     speechs:[[arr objectAtIndex:4] intValue]
                                     isvideo:[[arr objectAtIndex:5] boolValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}


#pragma mark -- NewsFeedCellDelegate --
- (void) willPlayVideo:(NewsFeedCell *)nfc
{
//    int index = [[tblList indexPathForCell:nfc] row];
}

- (void) willViewSpeechs:(NewsFeedCell *)nfc
{
//    int index = [[tblList indexPathForCell:nfc] row];
}

- (void) willAddLike:(NewsFeedCell *)nfc
{
//    int index = [[tblList indexPathForCell:nfc] row];
}


#pragma mark --
#pragma mark -- CustomNavBarViewDelegate --
- (void) didClickNavBarLeftButton
{
    ElementsViewController * controller = (ElementsViewController *)[[ElementsViewController alloc] viewFromStoryboard];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) didClickNavBarRightButton
{
    ;
}


@end
