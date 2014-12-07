//
//  ViewController.h
//  test111
//
//  Created by Apple on 12/4/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioToolbox.h>
#import "DemoTransition.h"

//#import "scc.h"
//#import "sc.h"
#import "CoverFlowTestViewController.h"
#import "coverflow2.h"
#import "AFOpenFlowView.h"
#import "SDDBrain.h"
@interface loginViewController1 : UIViewController
{
   
    UITextField *name;
    UITextField *pass;
    UIButton *button;
    NSString* uname;
    NSString* upwd;
    NSString* UIP;
    NSString* session;
    scc* sever;
    SDDBrain*test;
    coverflow2 *vc;
}
@property(nonatomic,retain)IBOutlet  UITextField *name;
@property(nonatomic,retain)IBOutlet  UITextField *pass;
@property(nonatomic,retain)IBOutlet  UITextField *ip;
@property(nonatomic,retain)IBOutlet  UITextField *port;
@property(nonatomic,retain)IBOutlet  UIButton *button;
-(IBAction)startedit:(id)sender;
-(IBAction)doneEdit:(id)sender;
-(IBAction)hide:(id)sender;
-(IBAction)test:(id)sender;

@end
