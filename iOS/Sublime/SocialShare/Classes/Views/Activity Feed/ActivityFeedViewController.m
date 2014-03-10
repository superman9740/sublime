//
//  ActivityFeedViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ActivityFeedViewController.h"
#import "ActivityFeedItemCell.h"

@interface ActivityFeedViewController ()

@end

@implementation ActivityFeedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self insertNavBarWithScreenName:STRDIC_ACTIVITYFEED];
    
    
    NSString * personPhoto = [self.appDelegate getResourcePathWithFilename:@"activityfeed-cell-photo1.png"];
    NSString * photo = [self.appDelegate getResourcePathWithFilename:@"activityfeed-cell-photo2.png"];
    arrItems = [[NSMutableArray alloc] init];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:1], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:2], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:3], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:4], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:5], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:6], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:7], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:8], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:9], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:0], photo, nil]];
    [arrItems addObject:[NSArray arrayWithObjects:personPhoto, @"svetlin", @"liked your photo", [NSNumber numberWithInt:10], photo, nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark --
#pragma mark -- UITableViewDelegate Method --
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

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
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int cellRow = [indexPath row];
    
	UITableViewCell * cell = nil;
    NSString *cellid = @"ActivityFeedItemCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[ActivityFeedItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    NSArray * arr = [arrItems objectAtIndex:cellRow];
    
    [(ActivityFeedItemCell *)cell setCellContentWith:[arr objectAtIndex:0]
                                                name:[arr objectAtIndex:1]
                                                desc:[arr objectAtIndex:2]
                                                 hrs:[[arr objectAtIndex:3] intValue]
                                               photo:[arr objectAtIndex:4]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
