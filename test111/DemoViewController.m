//
//  DemoViewController.m
//  RECurtainViewControllerExample
//
//  Created by Roman Efimov on 7/8/12.
//  Copyright (c) 2012 Roman Efimov. All rights reserved.
//

#import "DemoViewController.h"
#import "floorViewController.h"
#import "coverflow2.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)buttonPressed
{
    floorViewController *test = [[floorViewController alloc] init];
    [self curtainRevealViewController:test transitionStyle:RECurtainTransitionHorizontal];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
        
        
        
        

       /* UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((self.view.frame.size.width - 200) / 2, self.view.frame.size.height / 2 - 20, 200, 44);
        [button setTitle:@"Test button" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];*/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self performSegueWithIdentifier: @"seguePop" sender:self];
   // [vc sendsession:session Uip:UIP ];
	// Do any additional setup after loading the view.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"seguePop"]) {
        
        // Get destination view
        coverflow2 *vc =[segue destinationViewController];
        session=@"test";
        UIP=@"test";
        [vc sendsession:session Uip:UIP ];
        //CoverFlowTestViewController *vc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        
        //[vc monthSelect:indexbar];
        ///  [self dismissModalViewControllerAnimated:YES];
    }
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
