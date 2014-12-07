//
//  myScrollView.m
//  scrollTouch
//
//  Created by wangjun on 11-6-1.
//  Copyright 2011撟� __MyCompanyName__. All rights reserved.
//

#import "myScrollView.h"

#import "MyView.h"
@implementation myScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];


    return self;
}



- (void)dealloc
{
   // [super dealloc];
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    return YES;
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return NO;
}
@end