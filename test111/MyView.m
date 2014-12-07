//
//  MyView.m
//  scrollTouch
//
//  Created by wangjun on 11-6-1.
//  Copyright 2011撟� __MyCompanyName__. All rights reserved.
//

#import "MyView.h"          
#import "SVStatusHUD.h"

#define alignment 60;

@implementation MyView
@synthesize alive;
@synthesize start;
@synthesize alignmentSignal;
@synthesize alignmentNum;
@synthesize alignAnimate;
@synthesize touchable;
@synthesize status;
@synthesize statusChanged;
@synthesize oldLocation;
@synthesize godfather;
@synthesize aid;
@synthesize sid;
@synthesize rid;
@synthesize myplace;
@synthesize sheetSignal;
@synthesize activePopup = _activePopup;
//@synthesize FC;
-(NSString *)pictureWithType:(int)type status:(int)stat
{
    NSLog(@"pic type:%d status:%d",type,stat);
    if(status==0)
    {
        switch (type) {
            case 0:
                return @"app_0.png";
                break;
            case 1:
                return @"app_1_d.png";
                break;
			case 2:
                return @"app_2_d.png";
                break;
			case 3:
                return @"app_3_d.png";
                break;
			case 4:
                return @"app_4_d.png";
                break;
			case 5:
                return @"app_5_d.png";
                break;
			case 8:
                return @"app_8_d.png";
                break;
			case 10:
                return @"app_10_d.png";
                break;
			case 12:
                return @"app_12_d.png";
                break;
			case 14:
                return @"app_14_d.png";
                break;
			case 18:
                return @"app_18_d.png";
                break;
			case 19:
                return @"app_19_d.png";
                break;
			case 32:
                return @"app_32_d.png";
                break;
			case 34:
                return @"app_34_d.png";
                break;
			case 35:
                return @"app_35_d.png";
                break;
			case 37:
                return @"app_37_d.png";
                break;
			case 39:
                return @"app_39_d.png";
                break;
			case 56:
                return @"app_56_d.png";
                break;
                
            default:
                return @"app_0.png";
                break;
        }
        
    }
	/*else if(status==1)
	{
		switch(type)
		{
		    case 0:
                return @"app_0.png";
                break;
            case 1:
                return @"app_1.png";
                break;
			case 2:
                return @"app_2.png";
                break;
			case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;
		}
	}
	else if(status==2)
	{
		switch(type)
		{
            case 0:
                return @"app_0.png";
		    case 1:
                return @"app_1_1.png";
                break;
			case 2:
                return @"app_2_1.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
                
            default:
                return @"app_0.png";
                break;			
		}
        
	}
	else if(status==3)
	{
		switch(type)
		{
		    case 1:
                return @"app_1_2.png";
                break;
			case 2:
                return @"app_2_2.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
            default:
                return @"app_0.png";
                break;			
		}
        
	}
	else if(status==4)
	{
		switch(type)
		{
		    case 1:
                return @"app_1_3.png";
                break;
			case 2:
                return @"app_2_3.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;			
		}
        
	}*/
    else
    {
		switch(type)
		{
		    case 0:
                return @"app_0.png";
                break;
            case 1:
                return @"app_1.png";
                break;
			case 2:
                return @"app_2.png";
                break;
			case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;
		}
	}
}

/*-(void)deleteItem:(UILongPressGestureRecognizer*)gesure
 {
 
 if(UIGestureRecognizerStateBegan==gesure.state)
 {
 if(touchable==YES)
 {
 [newfather insertSubview:self atIndex:0];
 alive=NO;
 if(start==NO)alignmentSignal=YES;
 oldLocation=self.center;
 self.center=CGPointMake(-100, -100);
 }
 }
 [self removeFromSuperview];
 
 }*/

-(IBAction)scaduling:(id)sender
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
    NSString *tmp = [outputFormatter stringFromDate:datePicker.date];
    
    NSLog(@"ttttttttt");
    NSLog(tmp);
    /*    UILocalNotification *notif = [[UILocalNotification alloc] init];
     notif.fireDate = [datePicker date];
     notif.timeZone = [NSTimeZone defaultTimeZone];
     
     notif.alertBody = @"Did you forget something?";
     notif.alertAction = @"Show me";  
     ////
     
     */
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) 
    {
        
        //NSDate *now=[NSDate new];
        
        // notification.fireDate=[now addTimeInterval:period];
        notification.fireDate = [datePicker date];
        // notification.fireDate = [now dateByAddingTimeInterval:period];
        //NSLog(@"%d",period);
        NSLog(@"%@",datePicker.date);
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.soundName = @"ping.caf";
        //notification.alertBody=@"TIME！";
        level=(level==1)?0:1;
        //   NSString*abody=(level)?@"開啟":@"關閉";
        notification.alertBody = [NSString stringWithFormat:(level)?@"您的電器已開啟":@"您的電器已關閉"];
        NSArray*value=[[NSArray alloc]initWithObjects:[NSString  stringWithFormat:@"%d",aid],[NSString stringWithFormat:@"%d",level],[ NSString stringWithString:session] ,[ NSString stringWithString:UIP],nil];
        NSArray*key=[[NSArray alloc]initWithObjects:@"Sid",@"Level",@"session",@"UIP" ,nil];
        NSDictionary* info = [NSDictionary dictionaryWithObjects:value forKeys:key];
        notification.userInfo = info;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];      
        
    } 
    [cover removeFromSuperview];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //cancel clicked ...do your action
    }
    else if (buttonIndex == 1)
    {
        if(touchable==YES)
        {
            [newfather insertSubview:self atIndex:0];
            alive=NO;
            if(start==NO)alignmentSignal=YES;
            oldLocation=self.center;
            self.center=CGPointMake(-100, -100);
        }
    }
    else if (buttonIndex == 2) 
    {
        // UIImageView *schdule=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2.jpg"]]; 
        cover=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        UIView *schdule=[[UIView alloc]init];
        UIImageView *background=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"haha.JPG"]];
        datePicker = [[UIDatePicker alloc] init];
        datePicker.timeZone = [NSTimeZone localTimeZone];
        //datePicker.frame = CGRectMake(0, 0, 320, 180);
        CGRect tmppicker=CGRectMake(0, 0, 300, 180); 
        CGRect tmpframe=CGRectMake(0, 0, 360, 340); 
        CGRect tmpok=CGRectMake(10.0f, 280.0f, 180.0f, 40.0f); 
        tmpframe.origin=CGPointMake(332, 244);
        tmppicker.origin=CGPointMake(30, 30);
        tmpok.origin=CGPointMake(90, 220);
        CGRect tmpbackground=CGRectMake(0, 0, 360, 280); 
        UIButton *button;
        // datePicker
        cover.opaque=NO;
        button = [UIButton buttonWithType:111];
        [background setFrame:tmpbackground];
        [datePicker setFrame:tmppicker];
        [button setFrame:tmpok];
        [button setTitle:[NSString stringWithUTF8String:"確定"] forState:UIControlStateNormal];
        //    button se
        [button addTarget:self action:@selector(scaduling:) forControlEvents:UIControlEventTouchUpInside];
        [button setTintColor:[UIColor blueColor]];
        //  [self.view addSubview:button];
        //[ok setFrame:tmpok];
        [schdule addSubview:background];
        [schdule setFrame:tmpframe];
        [schdule addSubview:datePicker];
        [schdule addSubview:button];
        [schdule bringSubviewToFront:button];
        [cover addSubview:schdule];
        [godfather addSubview:cover];
        // [vvc performSegueWithIdentifier: @"segue1" sender:self];
        
    }
    else
    {
        sheetSignal=YES;
        // [FC setSheetAid:aid];
        // [FC performSegueWithIdentifier: @"segueSheet" sender: self];
    }
}


- (void) popupListcomponent:(PopupListComponent *)sender choseItemWithId:(int)itemId
{
    NSLog(@"User chose item with id = %d", itemId);
    int buttonIndex=itemId;
    // If you stored a "userInfo" object in the popup, access it as:
    id anyObjectToPassToCallback = sender.userInfo;
    NSLog(@"popup userInfo = %@", anyObjectToPassToCallback);
    //
    if (buttonIndex == 0)
    {
        //cancel clicked ...do your action
    }
    else if (buttonIndex == 1)
    {
        if(touchable==YES)
        {
            [newfather insertSubview:self atIndex:0];
            alive=NO;
            if(start==NO)alignmentSignal=YES;
            oldLocation=self.center;
            self.center=CGPointMake(-100, -100);
        }
    }
    else if (buttonIndex == 2)
    {
        // UIImageView *schdule=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2.jpg"]];
        cover=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        UIView *schdule=[[UIView alloc]init];
        UIImageView *background=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"haha.JPG"]];
        datePicker = [[UIDatePicker alloc] init];
        datePicker.timeZone = [NSTimeZone localTimeZone];
        //datePicker.frame = CGRectMake(0, 0, 320, 180);
        CGRect tmppicker=CGRectMake(0, 0, 300, 180);
        CGRect tmpframe=CGRectMake(0, 0, 360, 340);
        CGRect tmpok=CGRectMake(10.0f, 280.0f, 180.0f, 40.0f);
        tmpframe.origin=CGPointMake(332, 244);
        tmppicker.origin=CGPointMake(30, 30);
        tmpok.origin=CGPointMake(90, 220);
        CGRect tmpbackground=CGRectMake(0, 0, 360, 280);
        UIButton *button;
        // datePicker
        cover.opaque=NO;
        button = [UIButton buttonWithType:111];
        [background setFrame:tmpbackground];
        [datePicker setFrame:tmppicker];
        [button setFrame:tmpok];
        [button setTitle:[NSString stringWithUTF8String:"確定"] forState:UIControlStateNormal];
        //    button se
        [button addTarget:self action:@selector(scaduling:) forControlEvents:UIControlEventTouchUpInside];
        [button setTintColor:[UIColor blueColor]];
        //  [self.view addSubview:button];
        //[ok setFrame:tmpok];
        [schdule addSubview:background];
        [schdule setFrame:tmpframe];
        [schdule addSubview:datePicker];
        [schdule addSubview:button];
        [schdule bringSubviewToFront:button];
        [cover addSubview:schdule];
        [godfather addSubview:cover];
        // [vvc performSegueWithIdentifier: @"segue1" sender:self];
        
    }
    else
    {
        sheetSignal=YES;
        // [FC setSheetAid:aid];
        // [FC performSegueWithIdentifier: @"segueSheet" sender: self];
    }

    
    //
    // Free component object, since our action method recreates it each time:
    self.activePopup = nil;
}

- (void) popupListcompoentDidCancel:(PopupListComponent *)sender
{
    NSLog(@"Popup cancelled");
    
    // Free component object, since our action method recreates it each time:
    self.activePopup = nil;
}

- (void)setting:(UILongPressGestureRecognizer*)gesure
{
    CGRect bigFrame=CGRectMake(0, 0, 60, 60);
    CGRect inf=CGRectMake(0, 0, 60, 60);
    CGPoint tmp=self.center;
    tmp.x-=30;
    tmp.y-=30;
    bigFrame.origin=tmp;
    UIImageView* sview=[[self subviews]lastObject];
    [self setFrame:bigFrame];
    [sview setFrame:inf];
    if(UIGestureRecognizerStateBegan==gesure.state)
    {
        if(touchable==YES)
        {
            //
            
            if (self.activePopup) {
                // A popup is already active. Since we re-use our PopupListComponent object
                // for all popups, we need to cancel the active popup first:
                [self.activePopup hide];
            }
            
            PopupListComponent *popupList = [[PopupListComponent alloc] init];
            NSArray* listItems = nil;
            listItems = [NSArray arrayWithObjects:
                         [[PopupListComponentItem alloc] initWithCaption:@"隱藏此電器" image:nil itemId:1 showCaption:YES],
                         [[PopupListComponentItem alloc] initWithCaption:@"排程此電器" image:nil itemId:2 showCaption:YES],
                         [[PopupListComponentItem alloc] initWithCaption:@"歷史紀錄" image:nil itemId:3 showCaption:YES],
                         nil];
            
            // Optional: override any default properties you want to change, such as:
            popupList.textColor = [UIColor redColor];
            
            // Optional: store any object you want to have access to in the delegeate callback(s):
            popupList.userInfo = @"Value to hold on to";
            
            [popupList showAnchoredTo:self inView:newfather withItems:listItems withDelegate:self];
            
            self.activePopup = popupList;
            
            /*
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"進階設定"  
                                  //上面是標題的設定
                                  message:nil  //警告訊息內文的設定
                                  delegate:self // 叫出AlertView之後，要給該ViewController去處理
                                  
                                  cancelButtonTitle:@"取消"  //cancel按鈕文字的設定
                                  otherButtonTitles:@"隱藏此電器",@"排程此電器",@"歷史紀錄", nil]; // 其他按鈕的設定
            // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
            
            [alert show];  // 把alert這個物件秀出來
            alert=NULL;
            // NSLog(@"setting");
            //[alert release]; //釋放alert這個物件
             */
        }
    }
    
    
    
}

- (id)initWithFrame:(CGRect)frame type:(int)type status:(int)s start:(BOOL)t myfather:(UIView *)x newfather:(UIView *)y godfather:(UIView *)gf withoriginalsize:(CGPoint)z touchmode:(BOOL)toumode initLocation:(CGPoint)l level:(int)lev aid:(int)ad sid:(int)sd rid:(int)rd alive:(BOOL)av
{
    
    testmode=0;
    //testmode=1;
    NSLog(@"/////////\n ");
    CGRect tmpframe=CGRectMake(0, 0, 60, 60);
    sheetSignal=NO;
    tmpframe.origin=l;
    // [self setFrame:tmpframe];
    self = [super init];    //self = [super initWithFrame:frame];
    [self setFrame:tmpframe];
    
    
    sv=[[scc alloc]init];
    NSLog(@"testtest");
    
    deviceType=type;
    status=s;
    start=t;
    // NSLog(@"start is %d",(start==YES)?1:0);
    father=x;
    newfather=y;
    godfather=gf;
    bgsize=z;
    touchable=toumode;
    //level=lev;
    aid=ad;
    sid=sd;
    rid=rd;
    alive=av;
    level=(status>0)?1:0;
    statusChanged=NO;
    alignmentNum=0;
    alignmentSignal=NO;
    
    press=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(setting:)];
    //press.minimumPressDuration=3;
    
    [self addGestureRecognizer:press];
    
    NSLog(@"testtest %d %d",deviceType,status);
    
    pictureName=[[NSString alloc] initWithString:[self pictureWithType:deviceType status:status]];
    NSLog(@"testtest");
    UIImageView*tmppic=[[UIImageView alloc] initWithImage:[UIImage imageNamed:pictureName]];
    [tmppic setFrame:CGRectMake(0, 0, 60, 60)];
    
    [self addSubview:tmppic];
    
    
    myplace=self.center;
    if(start==YES)[newfather addSubview:self];
    else [father addSubview:self];
    //NSLog(@"itmemaked!!!!!!!!!!!!!!!!!!");
    NSLog(@"itemviewover!");
    return self;
}
-(void)statusChanged:(int)sts
{
    status=sts;
    NSString* text=[[NSString alloc] initWithString:[self pictureWithType:deviceType status:status]]; 
    pictureName=text;
    UIImageView* sview;
    while ((sview=[[self subviews]lastObject])!=nil) {
        
        [sview removeFromSuperview];
    }
    UIImageView*tmppic=[[UIImageView alloc] initWithImage:[UIImage imageNamed:pictureName]];
    [tmppic setFrame:CGRectMake(0, 0, 60, 60)];
    
    [self addSubview:tmppic];
    
    
}

-(void)whilezooming:(CGSize)now
{
    
    if(start==YES && alive==YES)
    {
        CGPoint fuck=self.center;
        float zoom=now.width/bgsize.x;
        fuck.x = fuck.x*zoom;
        fuck.y = fuck.y*zoom;
        self.center=fuck;
    }
    bgsize.x=now.width;
    bgsize.y=now.height;
}
-(void)animate
{   
    if(alignmentNum>0)
    {
        CGPoint t=self.center;
        t.x=t.x-10;
        self.center=t;
        myplace=t;
        alignmentNum-=10;
    }
    
    
}
-(void)align
{
    NSLog(@"align!!!!!!");
    if(start==NO)
    {
        alignmentNum=60;
        alignAnimate=[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animate) userInfo:nil repeats:YES];
        
    }
}
-(void)changeTouchModeTo:(BOOL)touchMode
{
    touchable=touchMode;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch!!!!");
    if(alive==NO)return;
    touch=[touches anyObject];
    
    if(touchable==NO || touch.tapCount!=1 || touch.view!=self)
    {
        if(touch.tapCount==2 && start==YES)
        {
            
            NSString*tmp;
            if(status==0)
            {
                tmp=@"開啓電器！";
                level=1;
                
                
            }
            else
            {
                tmp=@"關閉電器！";
                level=0;
                
            }
            
            // NSString*session=[sv logintest];
            NSLog(@"IO FOUND!! aid=%d sid=%d",aid,sid);
            [sv setItemSta:session :aid :level :UIP];
            //關電器還是////////////////////////////////////////////////////////
            //power_symbol
            [SVStatusHUD showWithImage:[UIImage imageNamed:@"power_symbol"] status:tmp];
           /*UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"開關物件"  
                                  //上面是標題的設定
                                  message:tmp //警告訊息內文的設定
                                  delegate:self // 叫出AlertView之後，要給該ViewController去處理
                                  
                                  cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                                  otherButtonTitles: nil]; // 其他按鈕的設定
            // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
            
            [alert show];  // 把alert這個物件秀出來
            // NSLog(@"status=====%d",(status==YES)?1:0);
            */
        }
        return;
    }
    CGRect bigFrame=CGRectMake(0, 0, 80, 80);
    CGRect inf=CGRectMake(0, 0, 80, 80);
    CGPoint tmp=self.center;
    tmp.x-=40;
    tmp.y-=40;
    bigFrame.origin=tmp;
    UIImageView* sview=[[self subviews]lastObject];
    [self setFrame:bigFrame];
    [sview setFrame:inf];
    
    if(start==NO)
    {
        [father bringSubviewToFront:self];
    }
    else
    {
        [newfather bringSubviewToFront:self];
    }
}

-(void)settouch:(int *)t
{
    touching=t;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    *touching=1;
    touch=[touches anyObject];
    if(touchable==NO || alive==NO || touch.tapCount!=1 ||  touch.view!=self )
    {
        
        return;
    }
    
    test=[touch locationInView:father];
    next=[touch locationInView:newfather];
    //next.y-=44;
    NSLog(@"%f %f",next.x,next.y);
    if(touch.view==self && alive==YES)
    {
        if(next.y>=640 && start==NO)
        {
            
            self.center=test;
        }
        else if(next.y>44)
        {
            if(start==NO)
            {
                alignmentSignal=YES;
                start=YES;
                [newfather addSubview:self];
            }
            self.center=next;
        }
        NSLog(@"touching!");
        
    }
}
-(void)setses:(NSString *)ses uip:(NSString *)up
{
    UIP=up;
    
    if(testmode!=1)session=[[NSString alloc]initWithString:ses];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(start==NO)
    {
        self.center=myplace;
    }
    *touching=0;
    CGRect bigFrame=CGRectMake(0, 0, 60, 60);
    CGRect inf=CGRectMake(0, 0, 60, 60);
    CGPoint tmp=self.center;
    tmp.x-=30;
    tmp.y-=30;
    bigFrame.origin=tmp;
    UIImageView* sview=[[self subviews]lastObject];
    [self setFrame:bigFrame];
    [sview setFrame:inf];
    
    return;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end