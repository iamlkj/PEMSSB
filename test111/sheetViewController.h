//
//  ViewController.h
//  cptest
//
//  Created by kai chieh liu on 12/4/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "scc.h"
//#import "AppDelegate.h"
@interface sheetViewController : UIViewController<CPTBarPlotDataSource, CPTPieChartDataSource, CPTBarPlotDelegate>
{
    int Aid;
    NSString*session;
	IBOutlet CPTGraphHostingView *scatterPlotView, *barChartView, *pieChartView;
	CPTXYGraph *graph, *barChart, *pieGraph;
	CPTPieChart *piePlot;
	BOOL piePlotIsRotating;
    scc*sv;
    NSMutableArray *data;
	NSMutableArray *dataForChart, *dataForPlot;
    NSString*UIP;
}

@property (readwrite, retain, nonatomic) NSMutableArray *dataForChart, *dataForPlot;
-(void)sentAid:(int)aid session:(NSString*)ses UIP:(NSString*)up;
// Plot construction methods
-(void)constructScatterPlot;
-(void)constructBarChart;
-(void)constructPieChart;
-(IBAction)back:(id)sender;
@end