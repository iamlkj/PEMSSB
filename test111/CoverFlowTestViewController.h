//
//  CoverFlowTestViewController.h
//  CoverFlowTest
//
//  Created by tt on 10-8-15.
//  Copyright TT 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"
#import "floorViewController.h"
@interface CoverFlowTestViewController : UIViewController <AFOpenFlowViewDataSource, AFOpenFlowViewDelegate>{
	NSArray *coverImageData;
    //UILabel *text;
    UINavigationItem *text;
    int floor;
    NSString*session;
    NSString*Uip;
}
-(void)sendsession:(NSString*)ses Uip:(NSString*)up;
@property (nonatomic,retain) IBOutlet UINavigationItem *text;

@end

