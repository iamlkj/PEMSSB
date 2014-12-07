//
//  scrollTouchViewController.h
//  scrollTouch
//
//  Created by wangjun on 11-6-1.
//  Copyright 2011撟� __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
#import "myScrollView.h"
#import "AppDelegate.h"
#import "SDDBrain.h"
#import "scc.h"
#import "schaduleViewController.h"
#import "sheetViewController.h"
#import "ViewControllerBarChart.h"
#import "UIViewController+RECurtainViewController.h"
#import "trainingController.h"
#import "AHAlertView.h"
#import <AudioToolbox/AudioToolbox.h>
@interface floorViewController : UIViewController {
    
    UIView *trainView;
    UIImageView *dec;
    UIImageView *bg;
    UIButton *button;
    UITextField *textField;
    MyView *myView;
    MyView *myView2;
    CGPoint im,bgsize;
    SDDBrain *brain;
    myScrollView* bar;
    myScrollView* view;
    BOOL fullScreen;
    int endOfTheIcon;
    int barTarget;
    int barNow;
    int newTouchSelect;
    BOOL touchmode;
    BOOL lock;
    
    int traininglock;
    int itemLock;
    int transferlock;
    int floor;
    int touching;
    int inTheMainView;
    UIButton* trainbtn1;
    NSTimer *timer;
    NSTimer *barControl;
    NSTimer *check;
    NSTimer *fed;
    NSTimer *trainingTimer;
    NSArray*itemArray;
    //NSArray*trainingOldArray;
    trainingController *trainingControl;
    NSString*session;
    NSString *floorname;
    NSString* UIP;
    NSString*modeName;
    float EDnum;
    IBOutlet UINavigationBar* controlBar;
    IBOutlet UISegmentedControl*  mode;
    IBOutlet UIBarButtonItem *itemDelete;
    scc*sv;
    MyView* Device[10000];
    int StatusTable[10000];
    int deviceList[10000];
    int trainingStatusTable[10000];
    int numberOfDevice;
    int sheetAid;
    int wateralert;
    int edalert;
    int edon;
    int testmode;
    BOOL isCurl;
    SystemSoundID toneSSIDs[10];
}
@property(nonatomic,retain)UINavigationBar* controlBar;
@property(nonatomic,retain)UISegmentedControl* mode;
-(void)sendsession:(NSString*)ses Uip:(NSString*)up;
-(IBAction)modeChange;
-(IBAction)Bar:(id)sender;
-(IBAction)back:(id)sender;
-(void)floorselect:(int)f;
-(NSDictionary*)scanItemWithSession:(int)ses;
-(NSDictionary*)locationWithSession:(int)ses;
-(void)newModeChange:(int)tslect;
-(void)setItemLocationWithSession:(int)ses 
                              Aid:(int)ad
                         Location:(CGPoint)l;
-(void)setItemLevelWithSession:(int)ses
                         Level:lev;
-(void)setIdWithSession:(int)ses
                    Aid:(int)ad;
-(void)saveData;
-(void)setSheetAid:(int)a;
@end