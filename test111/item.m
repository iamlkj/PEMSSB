//
//  item.m
//  final0115
//
//  Created by kai chieh liu on 12/1/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "item.h"

@implementation item
@synthesize location;
@synthesize type;
@synthesize idNumber;
@synthesize start;
@synthesize aid;
@synthesize rid;
@synthesize sid;
@synthesize level;
@synthesize status;
-(id)initWithType:(int)t Aid:(int)ad Sid:(int)sd Rid:(int)rd level:(int)lev status:(int)sts
{
    
    type=t;
    aid=ad;
    sid=sd;
    rid=rd;
    level=lev;
    status=sts;
    
    self=[super init];
    return self;
}
-(void)setLoc:(CGPoint)l
{
    location=l;
    if(location.x!=0||location.y!=0)
    {
        start=YES;
        // NSLog(@"loooooo%f  %f",location.x,location.y);
    }
    else
    {
        start=NO;
        //NSLog(@"start=no");
    }
}


@end
