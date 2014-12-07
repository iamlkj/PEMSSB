//
//  coverflow2.m
//  test111
//
//  Created by Apple on 12/4/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "coverflow2.h"
#import "AFOpenFlowView.h"
@implementation coverflow2
@synthesize text1;
-(void)sendsession:(NSString *)ses Uip:(NSString *)up
{
    
    session=ses;
    Uip=up;
}
- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index{
	text1.text = [NSString stringWithFormat:@"信義帝寶"];
    NSLog(@"request image for index called");
}
- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index{
	NSLog(@"selection did change called %d",index);
    //floor=index;
    text1.text = [NSString stringWithFormat:@"信義帝寶"];
    /*if(index==0)
     {
     text.text = [NSString stringWithFormat:@"B1"];
     }
     else
     {
     text.text = [NSString stringWithFormat:@"%dF",index];
     
     }*/
}
-(void)openFlowView:(AFOpenFlowView *)openFlowView imageSelected:(int)index
{
    // UIAlertView *infoAlertPanel = [[UIAlertView alloc]initWithTitle:@"OpenFlow Demo App" message:@"test by lbj" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
    NSLog(@"fuck    %d",index);
    
    //floor=index;
    [self performSegueWithIdentifier: @"seguebuildtoflow" sender: self];
    //[infoAlertPanel show];
}
- (UIImage *)defaultImage{
	text1.text = [NSString stringWithFormat:@"信義帝寶"];
    NSLog(@"default call");
	return [UIImage imageNamed:@"123.JPG"];
    
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"seguebuildtoflow"]) {
        
        // Get destination view
        CoverFlowTestViewController *vc =[segue destinationViewController];
        NSLog(Uip);
        NSLog(session);
        [vc sendsession:session Uip:Uip];
        //[vc sendsession:session Uip:UIP ];
        //CoverFlowTestViewController *vc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        
        //[vc monthSelect:indexbar];
        ///  [self dismissModalViewControllerAnimated:YES];
    }
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    

    [super viewDidLoad];
    [(AFOpenFlowView *)self.view setNumberOfImages:1];
    for (int i=0; i<1; i++) {
        // UIView *small=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 300)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"123.JPG"]];
        // CGRect frame=CGRectMake(0, 0, 500, 300);
        // [small addSubview:image];
        
        [(AFOpenFlowView *)self.view setImage:image forIndex:i];
    }
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
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

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 //Do something here
 if ([[segue identifier] isEqualToString:@"seguebuildtoflow"]) {
 
 // Get destination view
 NSLog(@"innnnnn%d",floor);
 CoverFlowTestViewController *vc = [segue destinationViewController];
 
 // Get button tag number (or do whatever you need to do here, based on your object
 //NSInteger tagIndex = [(UIButton *)sender tag];
 
 // Pass the information to your destination view
 //[vc floorselect:floor];
 }
 NSLog(@"Segue about to be performed");
 }*/


@end
