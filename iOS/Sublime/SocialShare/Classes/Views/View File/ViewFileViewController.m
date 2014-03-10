//
//  ViewFileViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/10/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ViewFileViewController.h"
#import "ViewFileItemCell.h"

@interface ViewFileViewController ()

@end

@implementation ViewFileViewController

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
    
    [self insertNavBarWithScreenName:STRDIC_VIEWFILE];
    
    
    // Set Profile
    NSString * photo1 = [self.appDelegate getResourcePathWithFilename:@"viewfile-examplephoto2.png"];
    NSString * photoExample = [self.appDelegate getResourcePathWithFilename:@"viewfile-examplephoto1.png"];;
    
    [imgvwPerson setImage:[UIImage imageWithContentsOfFile:photo1]];
    [imgvwPhoto setImage:[UIImage imageWithContentsOfFile:photoExample]];
    
    [lblTitle setText:@"On the ice"];
    [lblDesc setText:@"by Stanislov Kirlov"];
    [lblTime setText:[NSString stringWithFormat:@"%d minutes ago", 52]];
    [lblCommentCount setText:[NSString stringWithFormat:@"%d", 5]];
    [lblLikeCount setText:[NSString stringWithFormat:@"%d", 314]];
    
    
    
    // Temporary
    NSString * photo2 = [self.appDelegate getResourcePathWithFilename:@"activityfeed-cell-photo1.png"];
    
    arrItems = [[NSMutableArray alloc] init];
    [arrItems addObject:[NSArray arrayWithObjects:photo2, @"svetlin", @"This is awesom! I love photos of ice!", nil]];
    [arrItems addObject:[NSArray arrayWithObjects:photo2, @"asparuh", @"Ooooo Yeah!", nil]];
    [arrItems addObject:[NSArray arrayWithObjects:photo2, @"svetlin", @"liked your photo", nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) button_Click:(id)sender
{
    if ([sender isEqual:btnLike]) {
        ;
    }
    else if ([sender isEqual:btnComment]) {
        ;
    }
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
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int cellRow = [indexPath row];
    
	UITableViewCell * cell = nil;
    NSString *cellid = @"ViewFileItemCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[ViewFileItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    NSArray * arr = [arrItems objectAtIndex:cellRow];
    
    [(ViewFileItemCell *)cell setCellContentWith:[arr objectAtIndex:0]
                                                name:[arr objectAtIndex:1]
                                                desc:[arr objectAtIndex:2]];
    
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
