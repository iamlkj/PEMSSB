//
//  ViewController.m
//  test111
//
//  Created by Apple on 12/4/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "loginViewController1.h"
#import "DemoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "coverflow2.h"
#import "AHAlertView.h"
#import "AFOpenFlowView.h"
@implementation loginViewController1
@synthesize name;
@synthesize pass;
@synthesize ip;
@synthesize port;
@synthesize button;
int num=216*3/2;
int num1=216*3/2;
-(IBAction)test:(id)sender
{
    NSLog(@"hello");
    //NSTimeInterval animationDuration = 0.30f;  
    CGRect frame = self.view.frame;      
    frame.origin.x -=num1;
    NSLog(@"%d",num1);
    if(num1==216*3/2)
    {
        num1=0;
        num=216*3/2;
        
    }NSLog(@"edit end");
    frame.size. height -=216;     
    self.view.frame = frame;  
    //self.view移回原位置    
    //[UIView beginAnimations:@"Win7" context:nil];  
    //[UIView setAnimationDuration:animationDuration];  
    // self.view.frame = frame;                  
    //[UIView commitAnimations];
    
}
-(IBAction)startedit:(id)sender
{
    
    
    
    NSTimeInterval animationDuration = 0.30f;      
    CGRect frame = self.view.frame;  
    frame.origin.x +=num;
    if(num==216*3/2)
    {
        num=0;
        num1=216*3/2;
        
    } NSLog(@"edit begin");
    NSLog(@"%d",num1);
    frame.size.height +=216;  
    self.view.frame = frame;  
    [UIView beginAnimations:@"Win7" context:nil];  
    [UIView setAnimationDuration:animationDuration];  
    //self.view.frame = frame;                  
    [UIView commitAnimations]; 
}
- (void)showInfo {
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
    coverflow2 *controller=[sb instantiateViewControllerWithIdentifier:@"cf2"];
    //DemoViewController *controller = [[DemoViewController alloc] init] ;
    [controller sendsession:session Uip:UIP ];
    //[controller retain];
    //controller.delegate = self;

    DemoTransition *transition = [[DemoTransition alloc] init] ;
    
    EPGLTransitionView *glview = [[EPGLTransitionView alloc]
                                   initWithView:self.view
                                   delegate:transition] ;
    
#ifdef ENABLE_PHASE_IN
    
    // Get texture for the "next" view
    [glview prepareTextureTo:controller.view];
    
    // If you are using an "IN" animation for the "next" view set appropriate
    // clear color (ie no alpha)
    [glview setClearColorRed:0.3
                       green:0.3
                        blue:0.3
                       alpha:1.0];
#endif
    
    [glview startTransition];
    
    [self presentModalViewController:controller animated:NO];
    
}

-(IBAction)doneEdit:(id)sender
{
    //[self hidekb];
   // [self showInfo];
    //return;
  
    uname=[[NSString alloc]initWithString:name.text];
    upwd=[[NSString alloc]initWithString:pass.text];
    //  NSLog(name.text);
    
    NSString *IPstr=[[NSString alloc]initWithString:ip.text];
    NSString *PortStr=[[NSString alloc]initWithString:port.text];
    NSString *uIP=[[NSString alloc]initWithString:@"http://"];
    uIP=[uIP stringByAppendingFormat:IPstr];
    uIP=[uIP stringByAppendingFormat:@":"];
    uIP=[uIP stringByAppendingFormat:PortStr];
    UIP=uIP;
    ////////
     session=[sever login:uname :upwd :UIP];

    ////////
    
    
     //NSLog(@"i=%d",i);
    NSLog(@"judge");
    if(session!=NULL)
    {
        NSLog(@"succ");
        [self showInfo];
        /*
        vc=[[coverflow2 alloc] init];
        [vc sendsession:session Uip:UIP ];
        NSLog(@"hahahaha");
        [self curtainRevealViewController:vc transitionStyle:RECurtainTransitionHorizontal];
      //  [self performSegueWithIdentifier: @"seguePop" sender:self];
         */
    }
    else
    {
        NSString *title = @"Login Failed!";
        NSString *message = @"您的帳號或密碼錯誤!";
        
        AHAlertView *alert = [[AHAlertView alloc] initWithTitle:title message:message orien:UIInterfaceOrientationLandscapeRight];
        [alert setCancelButtonTitle:@"確定" block:^{
            alert.dismissalStyle = AHAlertViewDismissalStyleTumble;
        }];
        //[alert addButtonWithTitle:nil block:nil];
        [alert show];
    }
}
-(void)hidekb
{
    pass.secureTextEntry =YES;
    [name resignFirstResponder];
    [pass resignFirstResponder];
    //当用户按下ruturn，把焦点从textField移开那么键盘就会消失了
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.x -=num1;
    //NSLog(@"%d",num1);
    if(num1==216*3/2)
    {
        num1=0;
        num=216*3/2;
        
    }
    NSLog(@"edit end");
    frame.size. height -=216;
    self.view.frame = frame;
    //self.view移回原位置
    [UIView beginAnimations:@"Win7" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //self.view.frame = frame;
    [UIView commitAnimations];
}
-(IBAction)hide:(id)sender
{
     NSLog(@"hahahaha x=%f y=%f",self.view.frame.origin.x,self.view.frame.origin.y);
    pass.secureTextEntry =YES;
    [name resignFirstResponder];
    [pass resignFirstResponder];
    //当用户按下ruturn，把焦点从textField移开那么键盘就会消失了  
    NSTimeInterval animationDuration = 0.30f;  
    CGRect frame = self.view.frame;
   
    frame.origin.x -=num1;
    NSLog(@"hehehehe x=%f y=%f",frame.origin.x,frame.origin.y);
    //NSLog(@"%d",num1);
    if(num1==216*3/2)
    {
        num1=0;
        num=216*3/2;
        
    }
    NSLog(@"edit end");
    //frame.size. height -=216;
    self.view.frame = frame;  
    //self.view移回原位置    
    [UIView beginAnimations:@"Win7" context:nil];  
    [UIView setAnimationDuration:animationDuration];  
    //self.view.frame = frame;                  
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    ip.text=@"192.168.1.101";
    port.text=@"8080";
    sever=[[scc alloc]init];
    NSLog(@"haha");
    /*
     CFBundleRef *mainBundle=CFBundleGetMainBundle();
     NSLog(@"bundle %@",mainBundle);
     CFURLRef *sounfile;
     sounfile =CFBundleCopyResourceURL(mainBundle,(CFStringRef) @"test",CFSTR("mp3") , NULL);
     NSLog(@"sound%@",sounfile);
     UInt32 soundID;
     
     AudioServicesCreateSystemSoundID(sounfile, &soundID);
     AudioServicesPlaySystemSound(soundID);
     
     
     */
    
    // [scc init];
    [super viewDidLoad];
    //AudioServicesPlaySystemSound(1003);
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"seguePop"]) {
 
 // Get destination view
 coverflow2 *vc =[segue destinationViewController];
 [vc sendsession:session Uip:UIP ];
 //CoverFlowTestViewController *vc = [segue destinationViewController];
 
 // Get button tag number (or do whatever you need to do here, based on your object
 //NSInteger tagIndex = [(UIButton *)sender tag];
 
 // Pass the information to your destination view
 
 //[vc monthSelect:indexbar];
 ///  [self dismissModalViewControllerAnimated:YES];
 }
 
 }*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    /* if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
     return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
     } else {
     return YES;
     }*/
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}




 
 
@end
