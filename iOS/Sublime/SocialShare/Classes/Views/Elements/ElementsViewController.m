//
//  ElementsViewController.m
//  SocialShare
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "ElementsViewController.h"
#import "UIView+More.h"

@interface ElementsViewController ()

@end

@implementation ElementsViewController

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
    
    [self insertNavBarWithScreenName:STRDIC_ELEMENTS];
    
    // ProgressBar
    progressBar = [[UICustomProgressBar alloc] initWithFrame:CGRectMake( 20, 140, 280, 20)];
    [progressBar setCurrentPercentWithValue:50.0f];
    [self.view addSubview:progressBar];
    
    // Checkbox
    grpCheckbox = [[UIGroupCheckboxView alloc] initWithFrame:CGRectMake( 165, 195, 70, 29 )
                                                 titles:[NSArray arrayWithObjects:@"A", @"B", nil]
                                                 chkbox:YES];
    grpCheckbox.delegate = self;
    [self.view addSubview:grpCheckbox];
    
    
    // Radiobox
    grpRadio = [[UIGroupCheckboxView alloc] initWithFrame:CGRectMake( 245, 195, 70, 29 )
                                                   titles:[NSArray arrayWithObjects:@"A", @"B", nil]
                                                   chkbox:NO];
    grpRadio.delegate = self;
    [self.view addSubview:grpRadio];
    
    
    [btnShare setRoundedCornersWithRadius:4.0f
                              borderWidth:0
                              borderColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) sliderChanged:(id)sender
{
    ;
}


#pragma mark -- UIGroupCheckboxViewDelegate --
- (void) didClickCheckboxItem:(UIGroupCheckboxView *)gcv chkIndex:(int)index value:(BOOL)value
{
    ;
}

#pragma mark --
#pragma mark -- CustomNavBarViewDelegate --
- (void) didClickNavBarLeftButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) didClickNavBarRightButton
{
    ;
}

@end
