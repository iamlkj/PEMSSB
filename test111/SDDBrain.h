//
//  SDDBrain.h
//  final0115
//
//  Created by kai chieh liu on 12/1/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "item.h"
#import "scc.h"
@interface SDDBrain : NSObject
{
    NSMutableArray *itemArray;
    NSString*session;
    NSMutableArray *deadArray;
    int arrayNum;
    int ni;
    scc*sv;
    int testmode;
    NSString*UIP;
    NSMutableArray*haha;
    int x;
}
@property(nonatomic,retain)NSMutableArray *itemArray;
@property(nonatomic,retain)NSMutableArray *deadArray;
@property(nonatomic,readwrite)int arrayNum;

-(id)init;
//-(NSMutableArray*)scanWithSession:(int)ses;
-(void)setses:(NSString*)ses uip:(NSString*)up;
//-(void)checkNewItem:(int)endOfTheIcon;
//-(NSDictionary*)scanItemWithSession:(NSString*)ses;
//-(NSDictionary*)locationWithSession:(int)ses;
/*-(void)setItemLocationWithSession:(int)ses 
 Aid:(int)ad
 Location:(CGPoint)l;
 -(void)setItemLevelWithSession:(int)ses
 Level:lev;
 -(void)setIdWithSession:(int)ses
 Aid:(int)ad;
 */
-(NSArray*)scanWithNewSession:(NSString*)ses;
@end