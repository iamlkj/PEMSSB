//
//  ViewController.h
//  cptest
//
//  Created by kai chieh liu on 12/4/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "ViewControllerPieChart.h"
#import "scc.h"
@interface ViewControllerBarChart : UIViewController<CPTBarPlotDataSource, CPTPieChartDataSource, CPTBarPlotDelegate>
{
	IBOutlet CPTGraphHostingView *scatterPlotView, *barChartView, *pieChartView;
	CPTXYGraph *graph, *barChart, *pieGraph;
	CPTPieChart *piePlot;
	BOOL piePlotIsRotating;
    int indexbar;
	NSMutableArray *dataForChart, *dataForPlot;
    UIButton*back;
    NSString*session;
    scc*sv;
    NSMutableArray*data;
    IBOutlet UISegmentedControl*  mode;
    NSString*UIP;
}

@property (readwrite, retain, nonatomic) NSMutableArray *dataForChart, *dataForPlot;
@property(nonatomic,retain)UISegmentedControl* mode;
-(void)setSes:(NSString*)s UIP:(NSString*)up;
// Plot construction methods
-(void)constructBarChart;
-(void)constructScatterPlot;
-(IBAction)modeChange;
-(IBAction)back:(id)sender;
@end