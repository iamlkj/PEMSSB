//
//  ViewController.h
//  cptest
//
//  Created by kai chieh liu on 12/4/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface ViewControllerPieChart : UIViewController<CPTBarPlotDataSource, CPTPieChartDataSource, CPTBarPlotDelegate>
{
	IBOutlet CPTGraphHostingView *scatterPlotView, *barChartView, *pieChartView;
	CPTXYGraph *graph, *barChart, *pieGraph;
	CPTPieChart *piePlot;
	BOOL piePlotIsRotating;
    int floor;
    int month;
    UIView*maskview;
	NSMutableArray *dataForChart, *dataForPlot;
    NSString*UIP;
    NSString*session;
}

@property (readwrite, retain, nonatomic) NSMutableArray *dataForChart, *dataForPlot;
@property(nonatomic,assign)int floor;
// Plot construction methods
-(void)monthSelect:(int)m;
-(void)constructScatterPlot;
-(void)constructBarChart;
-(void)constructPieChart;
-(IBAction)back:(id)sender;
-(void)setSes:(NSString*)s UIP:(NSString*)up;
@end