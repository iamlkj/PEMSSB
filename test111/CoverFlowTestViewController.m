//
//  CoverFlowTestViewController.m
//  CoverFlowTest
//
//  Created by tt on 10-8-15.
//  Copyright TT 2010. All rights reserved.
//

#import "CoverFlowTestViewController.h"

@implementation CoverFlowTestViewController
@synthesize text;
- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index{
	NSLog(@"request image for index called");
}
- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index{
	NSLog(@"selection did change called %d",index);
    floor=index;
    if(index==0)
    {
        text.title = [NSString stringWithFormat:@"B1"];
    }
    else
    {
        text.title = [NSString stringWithFormat:@"%dF",index];
        
    }
}
-(void)openFlowView:(AFOpenFlowView *)openFlowView imageSelected:(int)index
{
    // UIAlertView *infoAlertPanel = [[UIAlertView alloc]initWithTitle:@"OpenFlow Demo App" message:@"test by lbj" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
    NSLog(@"fuck    %d",index);
    
    //floor=index;
    [self performSegueWithIdentifier: @"segueFlowToFloor" sender: self];
    //[infoAlertPanel show];
}
- (UIImage *)defaultImage{
	NSLog(@"default call");
	return [UIImage imageNamed:@"default.jpg"];
    
}
-(void)sendsession:(NSString *)ses Uip:(NSString *)up
{
    
    session=ses;
    Uip=up;
}
/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[(AFOpenFlowView *)self.view setNumberOfImages:8]; 
	for (int i=0; i<=7; i++) {
        // UIView *small=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 300)];
		UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"s%d.png",i%7]];
        NSLog(@"image=============%d",i);
        // CGRect frame=CGRectMake(0, 0, 500, 300);
        // [small addSubview:image];
        
		[(AFOpenFlowView *)self.view setImage:image forIndex:i];
	}
    [super viewDidLoad];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
    
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Do something here
    if ([[segue identifier] isEqualToString:@"segueFlowToFloor"]) {
        
        // Get destination view
        NSLog(@"innnnnn%d",floor);
        floorViewController *vc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        [vc floorselect:floor];
        [vc sendsession:session Uip:Uip];
    }
    NSLog(@"Segue about to be performed");
}


@end
