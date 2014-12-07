//
//  item.h
//  final0115
//
//  Created by kai chieh liu on 12/1/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyView.h"
@interface item : NSObject
{
    CGPoint location;
    int type;
    
    int aid;
    int sid;
    int rid;
    int level;
    
    
    BOOL start;
    
    int status;
    
    
}
@property(nonatomic)int status;
@property(readwrite)CGPoint location;
@property(readwrite)int type;
@property(readwrite)int idNumber;
@property(readwrite)BOOL start;
@property(nonatomic,assign)int aid;
@property(nonatomic,assign)int sid;
@property(nonatomic,assign)int rid;
@property(nonatomic,assign)int level;
//@property(readwrite)int n;
-(id)initWithType:(int)t
              Aid:(int)ad
              Sid:(int)sd
              Rid:(int)rd
            level:(int)lev
           status:(int)sts;
-(void)setLoc:(CGPoint)l;

@end
