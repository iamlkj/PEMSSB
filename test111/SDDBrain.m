//
//  SDDBrain.m
//  final0115
//
//  Created by kai chieh liu on 12/1/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SDDBrain.h"

@implementation SDDBrain
@synthesize itemArray;
@synthesize deadArray;
@synthesize arrayNum;
-(id)init
{
    testmode=0;
    //testmode=1;
    if(testmode==1)
    {
        haha=[[NSMutableArray alloc] init];
        x=1;
    }
    ni=6;
    sv=[[scc alloc]init];
    self=[super init];
    return self;
}
-(void)setses:(NSString *)ses uip:(NSString *)up
{
    if(testmode==1)return;
    UIP=up;
    session=[[NSString alloc]initWithString:ses];
}
-(NSArray*)scanWithNewSession:(NSString *)ses
{
    
    NSMutableArray*severArray;
    NSMutableDictionary*locat;
    NSMutableArray*tmp;

    if(testmode!=1)
    {
        severArray=[sv scanItem:session :UIP];
        locat=[sv location:session:UIP];
        tmp=[[NSMutableArray alloc]init];
        
        for(NSMutableDictionary*sitem in severArray)
        {
            item*tmpItem=[[item alloc]initWithType:[[sitem objectForKey:@"Type"] intValue]
                                               Aid:[[sitem objectForKey:@"AID"] intValue]
                                               Sid:[[sitem objectForKey:@"SID"] intValue]
                                               Rid:[[sitem objectForKey:@"RID"] intValue]
                                             level:1
                                            status:[[sitem objectForKey:@"Status"] intValue]];
            int tmploc=[[locat objectForKey:[sitem objectForKey:@"AID"]]intValue];
            
            //  NSLog(@"hdfh      x=%d y=%d",tmploc/1000,tmploc%1000);
            //if(tmpItem.aid==3)tmpItem.status=1;
            int x=tmploc/1000;
            int y=tmploc%1000;
            [tmpItem setLoc:CGPointMake(x,y )];
            
            [tmp addObject:tmpItem];
        }
        
        
        return tmp;
        
    }
    else
    {
        severArray=haha;
        locat=[[NSMutableDictionary alloc] init];
        tmp=[[NSMutableArray alloc]init];
        
        for(int i=1;i<6;i++)
        {
            item*tmpitem=[[item alloc]initWithType:i Aid:i Sid:i Rid:i level:1 status:((x>>(i-1))%2)];
            [tmpitem setLoc:CGPointMake(0,0 )];
            [tmp addObject:tmpitem];
        }
        NSLog(@"xxx=%d",x);
        x++;
        return  tmp;
    }

    

}

@end