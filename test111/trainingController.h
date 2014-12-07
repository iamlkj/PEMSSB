//
//  NSObject+trainingController.h
//  PMSSB
//
//  Created by LKJ on 12/8/22.
//
//

#import <Foundation/Foundation.h>
#import "segment.h"
@interface trainingController:NSObject
{
    int itemNum;
    UIView*targetView;
    int itemTable[1000][2];
    NSString*startTime;
    NSString*endTime;
    NSString*name;
    segment* seg;
    int startPtr;
    BOOL display;
    
}
-(void)setTime:(NSString*)time withMode:(int)mode;
-(id)initWithTarget:(UIView*)view;
-(void)addItemWithType:(int)type status:(int)status aid:(int)aid ;
-(void)cleanItemView;
-(void)sendTrainingStuff;
-(void)setName:(NSString*)n;
-(char*)detect;
-(void)cleanHistory;
@end
