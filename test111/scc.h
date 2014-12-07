//
//  scc.h
//  test_connection
//
//  Created by 建議 裡 on 12/4/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface scc : NSObject
{
    
}


-(NSString*)login:(NSString *)account :(NSString*)pwd :(NSString*)IP;
-(NSMutableArray*)scanItem:(NSString*)sessionID :(NSString*)IP;
-(NSMutableArray*)DeviceConsume:(NSString*)sessionID :(int)AID :(NSString*)IP;
-(NSMutableDictionary*)location:(NSString *)sessionID :(NSString*)IP;
-(void)setItemLoc:(NSString*)sessionID :(int)AID :(int)x :(int)y :(NSString*)IP;
-(void)setItemSta:(NSString*)sessionID :(int)SID :(int)Level :(NSString*)IP;
-(void)setID:(NSString*)sessionID :(int)AID :(NSString*)IP;
-(float)AIDused:(NSString*)sessionID :(NSString*)IP;


-(NSString*)logintest;
@end
