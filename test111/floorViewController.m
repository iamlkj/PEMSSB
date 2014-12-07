//
//  scrollTouchViewController.m
//  scrollTouch
//
//  Created by wangjun on 11-6-1.
//  Copyright 2011撟� __MyCompanyName__. All rights reserved.
//
//////////0403
/*
 fix touch while zooming
 fix delete
 boost drag
 delete nslog
 
 ///////
 plist
 
 
 
 */
#import "floorViewController.h"
#import "RecipeSegmentControl.h"
#import "SVStatusHUD.h"
//#import "AHAlertView.h"
#define decofset 666
#define offset 670
#define barItemNumber 5
@interface floorViewController()

@end
@implementation floorViewController

@synthesize controlBar;
@synthesize mode;

#pragma mark - View lifecycle



-(void)sendsession:(NSString*)ses Uip:(NSString*)up
{
    NSLog(@"session");
    if(testmode)
    {
        UIP=@"test";
        session=@"test";
    }
    else
    {
        UIP=up;
        session=ses;
    }

}
-(void)initTheIcon:(item *)anIcon
{
}
-(IBAction)back:(id)sender
{
    [self saveData];
    [self dismissModalViewControllerAnimated:YES];
}
-(void)floorselect:(int)f
{
    NSLog(@"floorselect");
    floor=f;
    if(testmode)floor=3;
    
    floorname=[NSString stringWithFormat:@"tt%d.jpg",floor];
        NSLog(@"~!!! %@ !!!~",floorname);

}
-(IBAction)trainViewFinish:(id)sender
{
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==3)
        {
            sub.image=[UIImage imageNamed:@"red.png"] ;
        }
    }
    [self doCurl];
 
    //self.mode.selectedSegmentIndex=2;
}
/*-(void)trainingTimerSetting
{
    
    NSArray *trainingItemArray;
    @synchronized(itemArray)
    {
        trainingItemArray=[[NSArray alloc] initWithArray:itemArray];
    }
        
        for(item*anItem in trainingItemArray)
        {
            if(trainingStatusTable[anItem.aid]!=anItem.status)
            {
                [trainingControl addItemWithType:anItem.type status:anItem.status aid:anItem.aid];
                trainingStatusTable[anItem.aid]=anItem.status;
            }
        }
}*/

-(IBAction)trainingStart:(id)sender
{
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==1)
        {
            sub.image=[UIImage imageNamed:@"red.png"] ;
        }
    }
    NSLog(@"text=%@",textField.text);
    if(lock==NO)
    {
        NSLog(@"tttttt [%@]",textField.text);
        if(textField.text.length==0)
        {
            [SVStatusHUD showWithImage:[UIImage imageNamed:@"pen_write"] status:@"請先輸入模式名稱"];
           /* UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"請先輸入模式名稱"
                                  //上面是標題的設定
                                  message:nil  //警告訊息內文的設定
                                  delegate:self // 叫出AlertView之後，要給該ViewController去處理
                                  cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                                  otherButtonTitles: nil]; // 其他按鈕的設定
            
            [alert show];  // 把alert這個物件秀出來
            alert=NULL;*/
            return;
        }
       /* NSDate *curentDate = [NSDate date];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* compoNents = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:curentDate]; // Get necessary date components
        
        int mm=[compoNents month]; //gives you month
        int dd=[compoNents day]; //gives you day
        int yy=[compoNents year]; // gives you year
        int hh= [compoNents hour];
        int ss=[compoNents second];*/
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH/mm/ss/yyyy/MM/dd|"];
        NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
        NSLog(@"%@", strDate);
        [trainingControl setTime:strDate withMode:0];

        
      //  [trainingControl cleanItemView];
    //    trainingTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(trainingTimerSetting) userInfo:nil repeats:YES];
        lock=YES;
    }
    else
    {
        //exclamation_mark
        [SVStatusHUD showWithImage:[UIImage imageNamed:@"exclamation_mark"] status:@"訓練已經開始"];
        /*UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"訓練已經開始"
                              //上面是標題的設定
                              message:nil  //警告訊息內文的設定
                              delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                              otherButtonTitles: nil]; // 其他按鈕的設定
        // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
        
        [alert show];  // 把alert這個物件秀出來
        alert=NULL;*/
    }
}
-(IBAction)trainingEnd:(id)sender
{
    //[trainingTimer invalidate];
    //trainingTimer=nil;
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==2)
        {
            sub.image=[UIImage imageNamed:@"red.png"] ;
        }
    }
    if(lock!=YES)
    {
        [SVStatusHUD showWithImage:[UIImage imageNamed:@"exclamation_mark"] status:@"訓練尚未開始"];
        /*
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"訓練尚未開始！"
                              //上面是標題的設定
                              message:nil  //警告訊息內文的設定
                              delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                              otherButtonTitles: nil]; // 其他按鈕的設定
        // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
        
        [alert show];  // 把alert這個物件秀出來
        alert=NULL;*/
        return;
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH/mm/ss/yyyy/MM/dd|"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"%@", strDate);
    [trainingControl setTime:strDate withMode:1];
    [trainingControl setName:textField.text];
    [trainingControl sendTrainingStuff];
     [trainingControl cleanItemView];
    
    NSString * msg=[textField.text stringByAppendingString:@" 上傳成功！"];
    [SVStatusHUD showWithImage:[UIImage imageNamed:@"check"] status:msg];
    
  /*  UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:msg
                          //上面是標題的設定
                          message:nil  //警告訊息內文的設定
                          delegate:self // 叫出AlertView之後，要給該ViewController去處理
                          cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                          otherButtonTitles: nil]; // 其他按鈕的設定
    // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
    
    [alert show];  // 把alert這個物件秀出來
    alert=NULL;
*/
    /*
    NSDate *curentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compoNents = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:curentDate]; // Get necessary date components
    int yy=[compoNents year]; 
    int mm=[compoNents month]; //gives you month
    int dd=[compoNents day]; //gives you day
    // gives you year
    int hh= [compoNents hour];
    int ss=[compoNents second];
     */
    textField.text=nil;
   
    lock=NO;
    [trainingControl cleanHistory];
}
-(IBAction)btndark:(id)sender
{
    NSLog(@"jaja");
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==3)
        {
            sub.image=[UIImage imageNamed:@"green"] ;
            break;
        }
    }
    
}
-(IBAction)btndarks:(id)sender
{
    NSLog(@"jaja");
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==1)
        {
            sub.image=[UIImage imageNamed:@"green"] ;
            break;
        }
    }
    
}
-(IBAction)btndarke:(id)sender
{
    NSLog(@"jaja");
    for(UIImageView*sub in [trainView subviews])
    {
        if(sub.tag==2)
        {
            sub.image=[UIImage imageNamed:@"green"] ;
            break;
        }
    }
    
}
- (void)setTrainView
{
    UIImageView*bgb;
    trainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024 , 768)];
    [trainView addSubview:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"train3.jpg"]]];
    CGRect tmpok;
    
    bgb=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    [bgb setFrame:CGRectMake(825, 480, 170, 50)];
    bgb.tag=2;
    [trainView addSubview:bgb];
    tmpok =CGRectMake(800, 470, 200.0f, 50.0f);
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:tmpok];
    [button setTitle:[NSString stringWithUTF8String:"END"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(trainingEnd:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(btndarke:) forControlEvents:UIControlEventTouchDown];
    [button setTintColor:[UIColor blackColor]];
    button.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:40.0];
    [trainView addSubview:button];
    
    bgb=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    [bgb setFrame:CGRectMake(825, 410, 170, 50)];
    bgb.tag=1;
    [trainView addSubview:bgb];
    tmpok =CGRectMake(800, 400, 200.0f, 50.0f);
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:tmpok];
    [button setTitle:[NSString stringWithUTF8String:"START"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btndarks:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(trainingStart:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:40.0];
    [button setTintColor:[UIColor blackColor]];
    [trainView addSubview:button];
    
    
    bgb=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    [bgb setFrame:CGRectMake(825, 650, 150, 50)];
    bgb.tag=3;
    [trainView addSubview:bgb];
    tmpok =CGRectMake(800, 640, 200.0f, 50.0f);
    //button= [UIButton buttonWithType:UIButtonTypeCustom];
    trainbtn1= [UIButton buttonWithType:UIButtonTypeCustom];
    [trainbtn1 setFrame:tmpok];
    //[button setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlEventTouchUpInside];
    [trainbtn1 setTitle:[NSString stringWithUTF8String:"OK"] forState:UIControlStateNormal];
    [trainbtn1 addTarget:self action:@selector(btndark:) forControlEvents:UIControlEventTouchDown];
    [trainbtn1 addTarget:self action:@selector(trainViewFinish:) forControlEvents:UIControlEventTouchUpInside];
    [trainbtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    trainbtn1.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:40.0];
    //[button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //[button setTintColor:[UIColor blueColor]];
    [trainView addSubview:trainbtn1];
    UIImageView*pen=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pencil.png"]];
    [pen setFrame:CGRectMake(670, 205, 300, 70)];
    [trainView addSubview:pen];
    
    textField=[[UITextField alloc] initWithFrame:CGRectMake(800, 230, 200, 40)];
    textField.borderStyle=UITextBorderStyleNone;
    textField.textColor  = [UIColor blackColor];
    textField.font =[UIFont systemFontOfSize:30];
    textField.placeholder=@"模式名稱";
    textField.backgroundColor=[UIColor clearColor];
    textField.autocorrectionType=UITextAutocorrectionTypeNo;
    textField.keyboardType=UIKeyboardTypeDefault;
    textField.returnKeyType=UIReturnKeyDone;
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    textField.delegate=self;
    [trainView addSubview:textField];
}
- (BOOL)textFieldShouldReturn:(UITextField *)tField {
    [tField resignFirstResponder];
    return NO;
}
- (void)loadView
{
    [super loadView];
    testmode=0;
    //testmode=1;
    if(testmode==1)
    {
        [self floorselect:1];
    }
    isCurl=NO;
    lock=NO;
    wateralert=0;
    touching=0;
    sv=[[scc alloc]init];
    for(int i=0;i<10000;i++)StatusTable[i]=-1;
    numberOfDevice=0;
    endOfTheIcon=0;
    brain=[[SDDBrain alloc] init];
    NSLog(@"get!");
    [brain setses:session uip:UIP];
    fullScreen=NO;
    CGRect decframe=CGRectMake(0, 0, 1024, decofset);
    barNow=650;
    barTarget=650;
    CGRect viewframe=CGRectMake(0, 0, 1024, 606);
    viewframe.origin.y=44;
    dec=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"type2.jpg"]];
    [dec setFrame:decframe];
    view=[[myScrollView alloc] initWithFrame:viewframe];
    bar=[[myScrollView alloc]initWithFrame:CGRectMake(0,0,1024,768)];
    [bar addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wood2.jpg"]]];
    bg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:floorname]];
    [view addSubview:bg];
    NSLog(@"getdesktop!");
    bgsize.x=1024;
    float miniScale=1024/bg.frame.size.width;
    bgsize.y=bg.frame.size.height*miniScale;
    
    [self setTrainView];
    
    
    view.maximumZoomScale=3.0;
    view.minimumZoomScale=miniScale;
    view.delegate=self;
    view.contentSize=bg.frame.size;
    [view setZoomScale:miniScale];
    [view setUserInteractionEnabled:YES];
    [view setScrollEnabled:YES];
    
    //[view setCanCancelContentTouches:NO];
    //[view addSubview:button];
    [view setBounces:NO];
    [view setBouncesZoom:NO];
   [self.view addSubview:trainView];
    [self.view addSubview:bar];
   // JPStupidButton* newbtn=[[JPStupidButton alloc] initWithFrame:CGRectMake(950, 400, 50, 50) ];
    [bar addSubview:dec];
    [bar addSubview:view];
   // [self.view addSubview:newbtn];
    
    
    
    itemArray=[brain scanWithNewSession:session];
    NSLog(@"afterscan");
    if(floor==3)
    {
        for(item*anItem in itemArray)
        {
            NSLog(@"item!!!!!!!!");
            if(anItem.start==NO)
            {
                
                CGPoint t;
                t.y=676;
                t.x=endOfTheIcon*60+30;
                endOfTheIcon=endOfTheIcon+1;
                NSLog(@"new!!!!!!!!%x",t.x);
                anItem.location=t;
            }
            CGPoint bgs;
            bgs.x=bg.frame.size.width;
            bgs.y=bg.frame.size.height;
            NSLog(@"lololol%f %f",anItem.location.x,anItem.location.y);
            //NSLog(@"start?%d",(anItem.start==YES)?1:0);
            Device[anItem.aid]=[[MyView alloc] initWithFrame:CGRectMake(0,0,60,60) type:anItem.type status:anItem.status start:anItem.start myfather:bar newfather:view godfather:self.view withoriginalsize:bgs touchmode:touchmode initLocation:anItem.location level:anItem.level aid:anItem.aid sid:anItem.sid rid:anItem.rid alive:YES];      
            Device[anItem.aid].touchable=touchmode;
            NSLog(@"lev1 pass");
            //     Device[anItem.aid].FC= self;
            [ Device[anItem.aid] settouch:&touching];
            NSLog(@"lev1.5 pass");
            [Device[anItem.aid] setses:session uip:UIP];
            NSLog(@"lev2 pass");
            StatusTable[anItem.aid]=anItem.status;
            deviceList[numberOfDevice]=anItem.aid;
            numberOfDevice=numberOfDevice+1;
            NSLog(@"nod is %d!!!!!!!!!!",numberOfDevice);
        }
        // endOfTheIcon=brain.arrayNum;
    }
    RecipeSegmentControl* recipeSelect=[[RecipeSegmentControl alloc] init];
    [recipeSelect setfloorvc:self];
    CGPoint org=CGPointMake(20, 44);
    CGRect frame=recipeSelect.frame;
    
    frame.origin=org;
    [recipeSelect setFrame:frame];
    [self.view addSubview:recipeSelect];
    [self.view bringSubviewToFront:controlBar];
    
}
-(void)trainingDetect
{
    traininglock=1;
    char* tmode=[trainingControl detect];
    NSLog(@"chkitem tr4");
    if(tmode!=NULL)
    {
        NSString*tmpName=[[NSString alloc] initWithCString:tmode encoding:NSASCIIStringEncoding] ;
        if([modeName isEqualToString:tmpName]==FALSE)
        {
            modeName=tmpName;
            
           [mode setTitle:modeName forSegmentAtIndex:2];
            
            
            AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"現在模式為" message:modeName orien:UIInterfaceOrientationPortrait];
           // AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"現在模式為" message:modeName];
            [alert setCancelButtonTitle:@"確定" block:^{
                alert.dismissalStyle = AHAlertViewDismissalStyleTumble;
            }];
            //[alert addButtonWithTitle:nil block:nil];
            [alert show];
            /*
            NSMutableString*haha=@"現在模式為 ";
            //[haha appendString:tmpName];
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: modeName
                                  //上面是標題的設定
                                  message:nil  //警告訊息內文的設定
                                  delegate:self // 叫出AlertView之後，要給該ViewController去處理
                                  cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                                  otherButtonTitles: nil]; // 其他按鈕的設定
            [alert show];  // 把alert這個物件秀出來
            alert=NULL;
             */
            [trainingControl cleanHistory];
        }
        
    }
    else
    {
        [mode setTitle:@"training mode" forSegmentAtIndex:2];
    }
    traininglock=0;
}
-(void)checkNewItem
{
      NSLog(@"checknewitem");
    //if(touching==0)
    //{
    //[NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
    //if(testmode)return;
    int tmped=0;
  
    //[NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
    // [NSThread detachNewThreadSelector:@selector(ED) toTarget:self withObject:nil];
    // int edalert=0;
    NSArray *tmpArray;
    
        if(itemLock==1)return;
    tmpArray=nil;
    transferlock=1;
        tmpArray=[[NSArray alloc]initWithArray:itemArray];
    transferlock=0;
    [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
    
    NSLog(@"chkitem 1");
    for(item*anItem in tmpArray)
    {
        NSLog(@"chkitem for1");
        if(trainingStatusTable[anItem.aid]!=anItem.status)
        {
            NSLog(@"chkitem tr1");
            [trainingControl addItemWithType:anItem.type status:anItem.status aid:anItem.aid];
            NSLog(@"chkitem tr2");
            trainingStatusTable[anItem.aid]=anItem.status;
            NSLog(@"chkitem tr3");
            if(traininglock!=1)
            {
                [NSThread detachNewThreadSelector:@selector(trainingDetect) toTarget:self withObject:nil];
            }

            
        }
        
        NSLog(@"chkitem for2");
        if(StatusTable[anItem.aid]>0)tmped+=1;
        
        if(StatusTable[anItem.aid]==-1)
        {
            if(barTarget==768)barTarget=650;
            if(anItem.start==NO)
            {
                CGPoint t;
                t.y=670;
                t.x=endOfTheIcon*60+30;
                //  NSLog(@"new place is %f",t.x);
                endOfTheIcon=endOfTheIcon+1;
                anItem.location=t;
            }
            //new device!
            CGPoint bgs;
            bgs.x=bg.frame.size.width;
            bgs.y=bg.frame.size.height;
            Device[anItem.aid]=[[MyView alloc] initWithFrame:CGRectMake(0,0,60,60) type:anItem.type status:anItem.status start:anItem.start myfather:bar newfather:view godfather:self.view withoriginalsize:bgs touchmode:touchmode initLocation:anItem.location level:anItem.level aid:anItem.aid sid:anItem.sid rid:anItem.rid alive:YES];
            NSLog(@"chkitem for3");
            Device[anItem.aid].touchable=touchmode;
            StatusTable[anItem.aid]=anItem.status;
            deviceList[numberOfDevice]=anItem.aid;
            numberOfDevice=numberOfDevice+1;
        }
        else if(StatusTable[anItem.aid]!=anItem.status)
        {
            NSLog(@"new status!!!!!!%d",anItem.aid);
            StatusTable[anItem.aid]=anItem.status;
            [Device[anItem.aid] statusChanged:anItem.status];
            
        }
        else if(anItem.aid==4 && StatusTable[anItem.aid]>0 &&wateralert==0 && inTheMainView==1)
        {
            wateralert=1;
            [SVStatusHUD showWithImage:[UIImage imageNamed:@"warning_bottle"] status:@"偵測到受限電器開啟：熱水器"];
            /*UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"警告！"  
                                  //上面是標題的設定
                                  message:@"偵測到受限電器開啟：熱水器" //警告訊息內文的設定
                                  delegate:self // 叫出AlertView之後，要給該ViewController去處理
                                  
                                  cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                                  otherButtonTitles: nil]; // 其他按鈕的設定
            // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
            [alert show];  // 把alert這個物件秀出來
            alert=NULL;*/
        }
    }
    
    edalert=tmped;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    

    edon=0;
    itemLock=0;
    traininglock=0;
    transferlock=0;
    inTheMainView=1;
    //  NSLog(@"viewdidload");
    //    myViewDictionary=[[NSMutableDictionary alloc]init];
    // endOfTheIcon=0;
    //numberOfDevice=0;
    //  deviceList=[[NSMutableArray alloc]init];
    //session=123;
    
    ////////////////////////////////////
    //self.mode.selectedSegmentIndex=0;
   // [self applyCustomAlertAppearance];
    newTouchSelect=0;
    touchmode=NO;
    for(int i=0;i<10000;i++)
    {
        trainingStatusTable[i]=0;
    }
    ////////////////////////////////////
    // Data.plist code 
    EDnum=0.0;
    // get paths from root direcory 
    //floor=3;
    ///////////////////////////////////
    trainingControl=[[trainingController alloc]initWithTarget:trainView];
   // [NSThread performSelectorInBackground:@selector(startTheBackgroundJob) withObject:nil];
    if(floor==3)
    {
        NSLog(@"timer on");
        timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        
        barControl=[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(bControl) userInfo:nil repeats:YES];
        int time=(testmode==1)?3:1;
        check=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(checkNewItem) userInfo:nil repeats:YES];
        fed=[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(fakeED) userInfo:nil repeats:YES];
     //   NSTimer *backgroundhaha=[NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(startTheBackgroundJob) userInfo:nil repeats:YES];
    }
    else
    {
        //[self bControl];
        CGRect viewTargetScreen=CGRectMake(0, 0, 1024, 724);
        viewTargetScreen.origin.y=44;
        view.frame=viewTargetScreen;    
    }
    CFBundleRef mainBundle = CFBundleGetMainBundle ();
    
    // Get the URL to the sound file to play. The file in this case
    // is "tap.aiff"
    NSString *toneFilename = [NSString stringWithFormat:@"pop"];
    NSURL *toneURLRef = [[NSBundle mainBundle] URLForResource:toneFilename
                                                withExtension:@"wav"];
    SystemSoundID toneSSID = 0;
    AudioServicesCreateSystemSoundID(
                                     (CFURLRef) CFBridgingRetain(toneURLRef),
                                     &toneSSID
                                     );
    toneSSIDs[0] = toneSSID;
}
-(void)fakeED
{
    
    if(edalert==4 &&edon==0)
    {
        edon=1;
        
        //
        AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"警告！" message:@"偵測到用電過量！請關閉一些電器以策安全！" orien:UIInterfaceOrientationPortrait];
        //AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"警告！" message:@"偵測到用電過量！"];
        [alert setCancelButtonTitle:@"確定" block:^{
            alert.dismissalStyle = AHAlertViewDismissalStyleTumble;
        }];
        //[alert addButtonWithTitle:nil block:nil];
        [alert show];
        
        /*
        UIAlertView *aler = [[UIAlertView alloc] 
                              initWithTitle:@"警告！"  
                              //上面是標題的設定
                              message:@"偵測到用電過量！" //警告訊息內文的設定
                              delegate:self // 叫出AlertView之後，要給該ViewController去處理
                              
                              cancelButtonTitle:@"確定"  //cancel按鈕文字的設定
                              otherButtonTitles: nil]; // 其他按鈕的設定
        // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
        
        [aler show];  // 把alert這個物件秀出來
         */
        alert=NULL;
    }
    
}
-(void)bControl
{
   // NSLog(@"touch=%d",touchmode==NO?0:1);
    if(barNow!=barTarget)
    {
        if(barNow<barTarget)
        {
            if(barNow+20<=barTarget)
            {
                barNow+=20;
                CGRect decframe=CGRectMake(0, 0, 1024, decofset);
                decframe.origin.y=barNow+-650;
                CGRect viewTargetScreen=CGRectMake(0, 0, 1024, barNow);
                viewTargetScreen.origin.y=44;
                view.frame=viewTargetScreen;
                [dec setFrame:decframe];
            }
            else
            {
                CGRect decframe=CGRectMake(0, 0, 1024, decofset);
                decframe.origin.y=barTarget-650;
                CGRect viewTargetScreen=CGRectMake(0, 0, 1024, barTarget);
                viewTargetScreen.origin.y=44;
                view.frame=viewTargetScreen;
                [dec setFrame:decframe];
            }
        }else
        {
            if(barNow-20>=barTarget)
            {
                barNow-=20;
                CGRect decframe=CGRectMake(0, 0, 1024, decofset);
                decframe.origin.y=barNow-650;
                CGRect viewTargetScreen=CGRectMake(0, 0, 1024, barNow);
                view.frame=viewTargetScreen;
                [dec setFrame:decframe];
            }
            else
            {
                CGRect decframe=CGRectMake(0, 0, 1024, decofset);
                decframe.origin.y=barTarget-650;
                CGRect viewTargetScreen=CGRectMake(0, 0, 1024, barTarget);
                view.frame=viewTargetScreen;
                [dec setFrame:decframe];
            }
        }
    }
    
}
- (void)startTheBackgroundJob {
    
    //   NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // wait for 3 seconds before starting the thread, you don’t have to do that. This is just an example how to stop the NSThread for some time
    //if(testmode)return;
    if(transferlock==1)[NSThread sleepForTimeInterval:0.5];
    NSLog(@"background!!!!!!!!!");
    //lock=YES;

    itemLock=1;
        itemArray=[brain scanWithNewSession:session];
    itemLock=0;
    
    //lock=NO;
    // [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    return;
    //  [pool release];
    
}

-(void)ED
{
    //  [NSThread sleepForTimeInterval:0];
    EDnum=[sv AIDused:session :UIP];
    NSLog(@"ED:%f",EDnum);
    
    /*
     
     UIAlertView *alert = [[UIAlertView alloc] 
     initWithTitle:@"警告"  
     //上面是標題的設定
     message:@"偵測到筆記型電腦！"  //警告訊息內文的設定
     delegate:self // 叫出AlertView之後，要給該ViewController去處理
     
     cancelButtonTitle:@"忽略"  //cancel按鈕文字的設定
     otherButtonTitles:@"關閉此電器", nil]; // 其他按鈕的設定
     // 如果要多個其他按鈕 >> otherButtonTitles: @"check1", @"check2", nil];
     
     [alert show];  // 把alert這個物件秀出來
     alert=NULL;
     
     */
    return;
}
-(IBAction)Bar:(id)sender
{
    [self performSegueWithIdentifier: @"segueBar" sender: self];
}

-(void)onTimer
{
    // NSLog(@"endofi==================%d",endOfTheIcon);
    CGPoint k;
    k.x=10000;
    BOOL someThingMov=NO;
    BOOL hideBar=YES;
    //NSLog(@"ontimer");
    if(testmode)return;
    // NSLog(@"noddddddis %d",numberOfDevice);
    
    for (int i=0;i<numberOfDevice;i++)
    {
        if(Device[deviceList[i]].sheetSignal==YES)
        { 
            [self setSheetAid:Device[deviceList[i]].aid];
            Device[deviceList[i]].sheetSignal=NO;
            
            [self performSegueWithIdentifier: @"segueSheet" sender:self];
        }
        if(Device[deviceList[i]].start==NO)
        {
            hideBar=NO;
            //   NSLog(@"no hide!!");
        }
        
        //NSLog(@"!!!!!%d",i);
        if(Device[deviceList[i]].alignmentSignal==YES)
        {
            
            Device[deviceList[i]].alignmentSignal=NO;
            someThingMov=YES;
            
        }
        else if(someThingMov==YES && Device[deviceList[i]].start==NO )
        {
            //     NSLog(@"%d allllll",i);
            [Device[deviceList[i]] align];
        }
    }
    if(someThingMov==YES)
    {
        endOfTheIcon--;
        
        
    }
    
    if (hideBar==YES && fullScreen==NO) {
        //self.makeBarDisapear;
        barTarget=768;
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //if (scrollView==view) {
    return bg;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    NSLog(@"scrolling");
    touching=1;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
{
    touching=0;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    touching=0;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    touching=1;
    //  NSLog(@"bgx===========%f",bg.frame.size.width);
    NSLog(@"nnnnn%d",numberOfDevice);
    for(int i=0;i<numberOfDevice;i++)
    {
        
        [Device[deviceList[i]] whilezooming:bg.frame.size];
        
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (void) doCurl
{
	//创建CATransition对象
	CATransition *animation = [CATransition animation];
	//相关参数设置
	[animation setDelegate:self];
	[animation setDuration:0.5f];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	//[animation setTimingFunction:<#(CAMediaTimingFunction *)#>]
    //向上卷的参数
	if(!isCurl)
	{
		//设置动画类型为pageCurl，并只卷一半
		[animation setType:@"pageCurl"];
		animation.endProgress=0.6;
        inTheMainView=0;
	}
	//向下卷的参数
	else
	{
		//设置动画类型为pageUnCurl，并从一半开始向下卷
		[animation setType:@"pageUnCurl"];
		animation.startProgress=0.4;
        inTheMainView=1;
	}
	//卷的过程完成后停止，并且不从层中移除动画
	[animation setFillMode:kCAFillModeForwards];
	//[animation setSubtype:kCATransitionFromBottom];
	[animation setSubtype:kCATransitionFromLeft];
    [animation setRemovedOnCompletion:NO];
    
	isCurl=!isCurl;
	
	[self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[[self.view layer] addAnimation:animation forKey:@"pageCurlAnimation"];
	
}
-(void)newModeChange:(int)tslect
{
    NSLog(@"in %d!!!!!!!!!!",tslect);
    newTouchSelect=tslect;
    switch (newTouchSelect) {
        case 0:
            touchmode=NO;
            for(int i=0;i<numberOfDevice;i++)
            {
                
                [Device[deviceList[i]] changeTouchModeTo:NO];
            }
            break;
        case 1:
            NSLog(@"newtouch!");
            touchmode=YES;
            //  touchmode=NO;
            for(int i=0;i<numberOfDevice;i++)
            {
                
                [Device[deviceList[i]] changeTouchModeTo:YES];
            }
            //  NSLog(@"yes move!!!!!");
            break;
        case 2:
            //train = [[TrainingViewController alloc] init];
            //[self curtainRevealViewController:train transitionStyle:RECurtainTransitionHorizontal];
           // [self.mode setSelectedSegmentIndex:2];
            //self.mode.selectedSegmentIndex=2;
            //[NSThread sleepForTimeInterval:5];
            [self doCurl];
            //NSLog(@"hahahahaha %d !",[[self.view subviews] count]);
            // [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
            
            break;
            
        default:
            break;
    }

    
}


/*-(IBAction)modeChange
{
   // TrainingViewController *train;
    switch (self.mode.selectedSegmentIndex) {
        case 0:
            //touchmode=NO;
            for(int i=0;i<numberOfDevice;i++)
            {
                
                //[Device[deviceList[i]] changeTouchModeTo:NO];
            }
            break;
        case 1:
            //touchmode=YES;
            //  touchmode=NO;
            for(int i=0;i<numberOfDevice;i++)
            {
                
               // [Device[deviceList[i]] changeTouchModeTo:YES];
            }
            //  NSLog(@"yes move!!!!!");
            break;
        case 2:
            //train = [[TrainingViewController alloc] init];
             //[self curtainRevealViewController:train transitionStyle:RECurtainTransitionHorizontal];
            //[self.mode setSelectedSegmentIndex:2];
            //self.mode.selectedSegmentIndex=2;
            //[NSThread sleepForTimeInterval:0.1];
            [self doCurl];
            //NSLog(@"hahahahaha %d !",[[self.view subviews] count]);
           // [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
            
            break;
            
        default:
            break;
    }
}*/
-(IBAction)itemDeleteMode
{
    
    return;
}

/*
 - (void)viewWillAppear:(BOOL)animated
 {
 [super viewWillAppear:animated];
 }
 */
-(void)setSheetAid:(int)a
{
    sheetAid=a;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(testmode)return;
    if ([[segue identifier] isEqualToString:@"segueSheet"]) {
        
        // Get destination view
        sheetViewController *vcc = [segue destinationViewController];
        [vcc sentAid:sheetAid session:session UIP:UIP];
        
        NSLog(@"sheetAid=%d",sheetAid);
        sheetAid=0;
        //vcc sentAid:<#(int)#> session:<#(NSString *)#>
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        
        //[vc monthSelect:indexbar];
        ///  [self dismissModalViewControllerAnimated:YES];
    }
    else if ([[segue identifier] isEqualToString:@"segueBar"]) 
    {
        ViewControllerBarChart*haha = [segue destinationViewController];
        [haha setSes:session UIP:UIP];
        //     *vcc = [segue destinationViewController];
        //  [vcc sentAid:sheetAid session:session];
        
    }
}
-(void)saveData
{
    if(testmode)return;
    [timer invalidate];
    timer = nil;
    [fed invalidate];
    fed = nil;
    [barControl invalidate];
    barControl = nil;
    [check invalidate];
    check = nil;
    //   NSString*session=[sv logintest];
    float k=1024/bg.frame.size.width;
    for (int i=0;i<numberOfDevice;i++)
    {
        if(Device[deviceList[i]].start==YES&&Device[deviceList[i]].alive==YES)
        {
            int x=Device[deviceList[i]].center.x*k-30;
            int y=Device[deviceList[i]].center.y*k-30;
            [sv  setItemLoc:session :Device[deviceList[i]].aid : x:y :UIP];
        }
        else if(Device[deviceList[i]].start==YES&&Device[deviceList[i]].alive==NO)
        {
            [sv  setItemLoc:session :Device[deviceList[i]].aid : 0:0 :UIP];
        }
        
    }
    
}
-(IBAction)saveData:(id)sender
{
    [self saveData];
}
/*
 
 - (void)viewWillDisappear:(BOOL)animated
 {
 [super viewWillDisappear:animated];
 }
 
 - (void)viewDidDisappear:(BOOL)animated
 {
 [super viewDidDisappear:animated];
 }
 
 - (void)viewDidUnload
 {
 [super viewDidUnload];
 // Release any retained subviews of the main view.
 // e.g. self.myOutlet = nil;
 }

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale{
    touching=0;
    
    
}
*/


@end