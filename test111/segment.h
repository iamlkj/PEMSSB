//
//  segment.h
//  hello2
//
//  Created by Apple on 12/7/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface segment : NSObject
{
    UILabel *segmentLabel;
    UISegmentedControl *segmentControl;
    UIButton *btn1; //phone
    UIButton *btn2; //fan
    UIButton *btn3; //blender
    UIButton *btn4; //toaster
    NSMutableData *responseData;
    NSMutableArray *name;
    NSMutableArray *activity;
    NSMutableArray *se;
    NSURLConnection *postConnection;
}
@property(nonatomic,retain)NSMutableArray *name; 
@property(nonatomic,retain)NSMutableArray *activity;
@property(nonatomic,retain)NSMutableArray *se; 
@property(nonatomic,retain)NSMutableData *responseData;

@property (nonatomic,retain) IBOutlet UILabel *segmentLabel;
@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic,retain) IBOutlet UIButton *btn1;
@property (nonatomic,retain) IBOutlet UIButton *btn2;
@property (nonatomic,retain) IBOutlet UIButton *btn3;
@property (nonatomic,retain) IBOutlet UIButton *btn4;



//-(IBAction) segmentedControlIndexChanged;
//-(IBAction) onClickbtn1;
//-(IBAction) onClickbtn2;
//-(IBAction) onClickbtn3;
//-(IBAction) onClickbtn4;

-(char *)detecting:(NSString *)now nowtime:(NSString *)time;
-(void)trainingwithNAME:(NSString *)postN withEVENT:(NSString *)postA withSTARTTIME:(NSString *)postS withENDTIME:(NSString *)postE;
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void)connectionDidfinishing:(NSURLConnection *)connection;
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end
