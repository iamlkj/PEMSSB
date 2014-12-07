//
//  AppDelegate.m
//  test111
//
//  Created by Apple on 12/4/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize window1;
@synthesize window2;
//@synthesize viewController1;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[window1 addSubview:viewController1.view];
    [window1 makeKeyAndVisible];
    [window2 makeKeyAndVisible];
    UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) 
    {
        NSLog(@"Recieved Notification %@",localNotif);
        NSDictionary* infoDic = localNotif.userInfo;
        NSLog(@"userInfo description=%@",[infoDic description]);
        int sd = [[infoDic objectForKey:@"Sid"] intValue];
        int level=[[infoDic objectForKey:@"Level"] intValue];
        
        scc*sv=[[scc alloc]init];
        NSString*session=[infoDic objectForKey:@"session"];
        NSString* UIP=[infoDic objectForKey:@"UIP"];
        [sv setItemSta:session :sd :level :UIP];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // [viewController saveData];
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in caeeterminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif
{
    
    
    if (notif) 
    {
        // NSString*session=[sv logintest];
        //[sv setItemSta:session :sid :level];
        //關電器還是////////////////////////////////////////////////////////
        UIAlertView *alert = [[UIAlertView alloc] 
                              initWithTitle:@"排程物件"  
                              //上面是標題的設定
                              message:@"您的物件已排程！"//警告訊息內文的設定
                              delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              
                              cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                              otherButtonTitles: nil]; // 其他按鈕的設定
        // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
        [alert show];
        NSLog(@"Recieved Notification %@",notif);
        NSDictionary* infoDic = notif.userInfo;
        NSLog(@"userInfo description=%@",[infoDic description]);
        int sd = [[infoDic objectForKey:@"Sid"] intValue];
        int level=[[infoDic objectForKey:@"Level"] intValue];
        scc*sv=[[scc alloc]init];
        NSString*session=[infoDic objectForKey:@"session"];
        NSString*uip=[infoDic objectForKey:@"UIP"];
        [sv setItemSta:session :sd :level :uip];
        
        //NSLog(sd);
        
    }
    
}
/*-(void)setVC:(floorViewController *)vc
 {
 NSLog(@"save!!!!!");
 viewController=vc;
 }*/
@end
