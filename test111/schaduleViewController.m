//
//  schaduleViewController.m
//  test111
//
//  Created by Apple on 12/4/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "schaduleViewController.h"

@implementation schaduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)loadView
{
    /* UIView *cover=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
     UIView *schdule=[[UIView alloc]init];
     UIImageView *background=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2.jpg"]];
     UIDatePicker *datePicker = [[UIDatePicker alloc] init];
     //datePicker.frame = CGRectMake(0, 0, 320, 180);
     CGRect tmppicker=CGRectMake(0, 0, 320, 180); 
     CGRect tmpframe=CGRectMake(0, 0, 360, 280); 
     CGRect tmpok=CGRectMake(10.0f, 280.0f, 180.0f, 40.0f); 
     tmpframe.origin=CGPointMake(332, 244);
     tmppicker.origin=CGPointMake(20, 20);
     tmpok.origin=CGPointMake(90, 215);
     CGRect tmpbackground=CGRectMake(0, 0, 360, 280); 
     UIButton *button;
     // datePicker
     cover.opaque=NO;
     button = [UIButton buttonWithType:111];
     [background setFrame:tmpbackground];
     [datePicker setFrame:tmppicker];
     [button setFrame:tmpok];
     [button setTitle:[NSString stringWithUTF8String:"確定"] forState:UIControlStateNormal];
     [button setTintColor:[UIColor blueColor]];
     //  [self.view addSubview:button];
     //[ok setFrame:tmpok];
     [schdule addSubview:background];
     [schdule setFrame:tmpframe];
     [schdule addSubview:datePicker];
     [schdule addSubview:button];
     [schdule bringSubviewToFront:button];
     [cover addSubview:schdule];
     [self.view addSubview:cover];*/
}
/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	 return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
