//
//  coverflow2.h
//  test111
//
//  Created by Apple on 12/4/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"
#import "CoverFlowTestViewController.h"
@interface coverflow2 : UIViewController <AFOpenFlowViewDataSource, AFOpenFlowViewDelegate>{
	NSArray *coverImageData;
    UILabel *text;
    int floor;
    int Aid;
    NSString* session;
    NSString* Uip;
}
@property (nonatomic,retain) IBOutlet UILabel *text1;
-(void)sendsession:(NSString*)ses Uip:(NSString*)up;

@end