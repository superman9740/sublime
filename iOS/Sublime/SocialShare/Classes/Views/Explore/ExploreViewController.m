//
//  ExploreViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

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
    
    [self insertNavBarWithScreenName:STRDIC_EXPLORE];
    
    searchBar = [UICustomSearchBar viewFromNib];
    searchBar.delegate = self;
    [searchBar setFrame:CGRectMake( 0, 63, 320, 41 )];
    [self.view addSubview:searchBar];
    
    
    // Temporary Data
    NSString * photo = [self.appDelegate getResourcePathWithFilename:@"explore-photoexample.png"];
    
    arrItems = [[NSMutableArray alloc] init];
    [arrItems addObject:[NSArray arrayWithObjects:@"RECENTLY FROM YOUR FRIENDS", [NSArray arrayWithObjects:photo, photo, photo, nil], nil]];
    [arrItems addObject:[NSArray arrayWithObjects:@"POPULAR TODAY", [NSArray arrayWithObjects:photo, photo, photo, nil], nil]];
    [arrItems addObject:[NSArray arrayWithObjects:@"POPULAR THIS WEEK", [NSArray arrayWithObjects:photo, photo, photo, nil], nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark --
#pragma mark -- UICustomSearchBarDelegate --

- (void) beginInputKeyword:(UICustomSearchBar *)searchBar
{
    ;
}


- (void) performSearching:(UICustomSearchBar *)searchBar
{
    ;
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
    NSString *cellid = @"ExploreVideoItemCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[ExploreVideoItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSArray * arr = [arrItems objectAtIndex:cellRow];
    
    [(ExploreVideoItemCell *)cell setDelegate:self];
    [(ExploreVideoItemCell *)cell setCellContentWith:[arr objectAtIndex:0] photos:[arr objectAtIndex:1]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}



#pragma mark --
#pragma mark -- ExploreVideoItemCellDelegate --
- (void) willPlayVideoFrom:(ExploreVideoItemCell *)evic index:(int)index
{
    // Play the selected Video
    [self showAlertWithTitle:@"Play a Video"
                     message:@"App will play a video..."
                    receiver:self
           cancelButtonTitle:@"Ok"
                otherButtons:nil];
}



#pragma mark --
#pragma mark -- CustomNavBarViewDelegate --

- (void) didClickNavBarLeftButton
{
    ;
}



- (void) didClickNavBarRightButton
{
    ;
}


@end
