//
//  MyView.h
//  scrollTouch
//
//  Created by wangjun on 11-6-1.
//  Copyright 2011撟� __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//testmode
//#import "floorViewController.h"
#import "scc.h"
#import "PopupListComponent.h"
@interface MyView : UIView {
    PopupListComponent* activePopup;
    int aid;
    int sid;
    int rid;
    int deviceType;
    int status;
    int level;
    int* touching;
    scc*sv;
    ///////
    BOOL alive;
    
    /////////
    int testmode;
    UITouch*touch;
    CGPoint next;
    CGPoint test;
    CGPoint myplace;
    CGPoint bgsize;
    CGPoint oldLocation;
    UIView* father;
    UIView* newfather;
    NSString* pictureName;
    NSString*session;
    //   floorViewController*FC;
    //SDDBrain* ourBrain;
    BOOL start;
    BOOL alignmentSignal;
    BOOL touchable;
    int alignmentNum;
    NSTimer*alignAnimate;
    BOOL statusChanged;
    //  BOOL deviceType;
    UILongPressGestureRecognizer* press;
    UIView*godfather;
    UIView*cover;
    UIDatePicker *datePicker;
    BOOL sheetSignal;
    NSString*UIP;
    
    
}
//@property(nonatomic,retain)floorViewController*FC;
@property(nonatomic,assign)BOOL sheetSignal;
@property(nonatomic,assign)int sid;
@property(nonatomic,assign)int aid;
@property(nonatomic,assign)int rid;
@property(nonatomic)CGPoint oldLocation;
@property(nonatomic)CGPoint myplace;
@property(nonatomic)BOOL alive;
@property(nonatomic)int status;
@property(nonatomic)BOOL statusChanged;
@property(nonatomic) BOOL touchable;
@property(nonatomic) int alignmentNum;
@property(nonatomic) BOOL start;
@property(nonatomic) BOOL alignmentSignal;
@property(retain)NSTimer* alignAnimate;
@property(nonatomic,retain)UIView*godfather;
@property (nonatomic, strong) PopupListComponent* activePopup;
-(void)setses:(NSString*)ses uip:(NSString*)up;
-(void)settouch:(int*)t;
-(void)whilezooming:(CGSize)now;
-(void)align;

-(void)changeTouchModeTo:(BOOL)touchMode;
- (id)initWithFrame:(CGRect)frame 
               type:(int)type 
             status:(int)s 
              start:(BOOL)t
           myfather:(UIView *)x
          newfather:(UIView *)y
          godfather:(UIView*)gf
   withoriginalsize:(CGPoint)z
          touchmode:(BOOL)toumode
       initLocation:(CGPoint)l
              level:(int)l
                aid:(int)ad
                sid:(int)sd
                rid:(int)rd
              alive:(BOOL)av;


-(void)statusChanged:(int) sts;
-(IBAction)scaduling:(id)sender;

//- (void)control:(floorViewController*)x;
@end