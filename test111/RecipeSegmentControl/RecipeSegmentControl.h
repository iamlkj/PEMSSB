//
//  RecipeSegmentControl.h
//  RecipeSegmentControlDemo
//
//  Created by Derek Yang on 05/30/12.
//  Copyright (c) 2012 Derek Yang. All rights reserved.
//


#import "SegmentButtonView.h"
#import "floorViewController.h"
@interface RecipeSegmentControl : UIView <SegmentButtonViewDelegate>
{
    floorViewController*vc;
}
-(void)setfloorvc:(floorViewController*)fvc;
@end
