//
//  AppDelegate.h
//  test111
//
//  Created by Apple on 12/4/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scc.h"
#import "floorViewController.h"
@class CoverFlowTestViewController1;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window1;
   //UIViewController* viewController;
    
   // CoverFlowTestViewController1 *viewController1;
}

//@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet UIWindow *window1;
@property (nonatomic, retain) IBOutlet UIWindow *window2;
//@property (nonatomic, retain) IBOutlet CoverFlowTestViewController1 *viewController1;
//-(void)setVC:(UIViewController*)vc;
@end
