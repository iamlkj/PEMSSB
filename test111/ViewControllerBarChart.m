//
//  ViewController.m
//  cptest
//
//  Created by kai chieh liu on 12/4/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerBarChart.h"

@implementation ViewControllerBarChart
@synthesize dataForChart, dataForPlot;
@synthesize mode;
#pragma mark -
#pragma mark Initialization and teardown

-(void)viewDidLoad
{
	[super viewDidLoad];
    sv=[[scc alloc]init];
    self.mode.selectedSegmentIndex=1;
    NSLog(@"hahahahaXDDD");
    [self constructScatterPlot];
	[self constructBarChart];
    [self.view bringSubviewToFront:scatterPlotView];
}
-(IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    
}
-(IBAction)modeChange
{
    
    switch (self.mode.selectedSegmentIndex) {
        case 0:
            [self.view bringSubviewToFront:barChartView];
            break;
        case 1:
            [self.view bringSubviewToFront:scatterPlotView];
            //  NSLog(@"yes move!!!!!");
            break;
        default:
            break;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
	// Add a rotation animation
	CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	rotation.removedOnCompletion = YES;
	rotation.fromValue			 = [NSNumber numberWithFloat:M_PI * 5];
	rotation.toValue			 = [NSNumber numberWithFloat:0.0f];
	rotation.duration			 = 1.0f;
	rotation.timingFunction		 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	rotation.delegate			 = self;
	[piePlot addAnimation:rotation forKey:@"rotation"];
    
	piePlotIsRotating = YES;
}

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	piePlotIsRotating = NO;
	[piePlot performSelector:@selector(reloadData) withObject:nil afterDelay:0.4];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	if ( UIInterfaceOrientationIsLandscape(fromInterfaceOrientation) ) {
		// Move the plots into place for portrait
		barChartView.frame	  = CGRectMake(0.0f, 30.0f, 720.0f, 1024.0f);
	}
	else {
		// Move the plots into place for landscape
		barChartView.frame	  = CGRectMake(0.0f, 30.0f, 1024.0f, 720.0f);
	}
}

-(void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

-(void)viewDidUnload
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



#pragma mark -
#pragma mark Plot construction methods

-(void)constructScatterPlot
{
    
    
	// Create graph from theme
    data=[sv DeviceConsume:session :0 :UIP];
	graph = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
	CPTTheme *theme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
	[graph applyTheme:theme];
	scatterPlotView.hostedGraph = graph;
    
	graph.paddingLeft	= 10.0;
	graph.paddingTop	= 10.0;
	graph.paddingRight	= 10.0;
	graph.paddingBottom = 10.0;
    
	// Setup plot space
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
	plotSpace.allowsUserInteraction = NO;
    float max;
    for(NSString*t in data)
    {
        max=([t floatValue]>max)?[t floatValue]:max;
        
    }
    ////////////////////
	plotSpace.xRange				= [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(-125.0) length:CPTDecimalFromFloat(130.0)];
	plotSpace.yRange				= [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(-1*(max/10)) length:CPTDecimalFromFloat(max+max/5)];
    
    
    /////////////////////////////////////////////////////
	// Axes
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
	CPTXYAxis *x		  = axisSet.xAxis;
	x.majorIntervalLength		  = CPTDecimalFromString(@"15.0");
	x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	x.minorTicksPerInterval		  = 2;
	NSArray *exclusionRanges = [NSArray arrayWithObjects:
								[CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(1.99) length:CPTDecimalFromFloat(0.02)],
								[CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.99) length:CPTDecimalFromFloat(0.02)],
								[CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(2.99) length:CPTDecimalFromFloat(0.02)],
								nil];
	x.labelExclusionRanges = exclusionRanges;
    
	CPTXYAxis *y = axisSet.yAxis;
    int vel=(int)(max/10);
    vel=(vel>10)?(vel-vel%10):vel;
	y.majorIntervalLength		  = CPTDecimalFromInt(vel);
	y.minorTicksPerInterval		  = 5;
	y.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	exclusionRanges				  = [NSArray arrayWithObjects:
									 [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(1.99) length:CPTDecimalFromFloat(0.02)],
									 [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.99) length:CPTDecimalFromFloat(0.02)],
									 [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(3.99) length:CPTDecimalFromFloat(0.02)],
									 nil];
	y.labelExclusionRanges = exclusionRanges;
    
	// Create a green plot area
	CPTScatterPlot *dataSourceLinePlot = [[CPTScatterPlot alloc] init] ;
	dataSourceLinePlot.identifier = @"Green Plot";
    
	CPTMutableLineStyle *lineStyle = [dataSourceLinePlot.dataLineStyle mutableCopy] ;
	lineStyle.lineWidth				 = 3.f;
	lineStyle.lineColor				 = [CPTColor greenColor];
	lineStyle.dashPattern			 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:5.0f], [NSNumber numberWithFloat:5.0f], nil];
	dataSourceLinePlot.dataLineStyle = lineStyle;
    
	dataSourceLinePlot.dataSource = self;
    
	// Put an area gradient under the plot above
	CPTColor *areaColor		  = [CPTColor colorWithComponentRed:0.3 green:1.0 blue:0.3 alpha:0.8];
	CPTGradient *areaGradient = [CPTGradient gradientWithBeginningColor:areaColor endingColor:[CPTColor clearColor]];
	areaGradient.angle = -90.0f;
	CPTFill *areaGradientFill = [CPTFill fillWithGradient:areaGradient];
	dataSourceLinePlot.areaFill		 = areaGradientFill;
	dataSourceLinePlot.areaBaseValue = CPTDecimalFromString(@"1.75");
    
	// Animate in the new plot, as an example
	dataSourceLinePlot.opacity		  = 0.0f;
	dataSourceLinePlot.cachePrecision = CPTPlotCachePrecisionDecimal;
	[graph addPlot:dataSourceLinePlot];
    
	CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeInAnimation.duration			= 1.0f;
	fadeInAnimation.removedOnCompletion = NO;
	fadeInAnimation.fillMode			= kCAFillModeForwards;
	fadeInAnimation.toValue				= [NSNumber numberWithFloat:1.0];
	[dataSourceLinePlot addAnimation:fadeInAnimation forKey:@"animateOpacity"];
    
	// Create a blue plot area
	CPTScatterPlot *boundLinePlot = [[CPTScatterPlot alloc] init] ;
	boundLinePlot.identifier = @"Blue Plot";
    
	lineStyle			 = [boundLinePlot.dataLineStyle mutableCopy] ;
	lineStyle.miterLimit = 1.0f;
	lineStyle.lineWidth	 = 3.0f;
	lineStyle.lineColor	 = [CPTColor blueColor];
    
	boundLinePlot.dataSource	 = self;
	boundLinePlot.cachePrecision = CPTPlotCachePrecisionDouble;
	boundLinePlot.interpolation	 = CPTScatterPlotInterpolationHistogram;
	[graph addPlot:boundLinePlot];
    
	// Do a blue gradient
	CPTColor *areaColor1	   = [CPTColor colorWithComponentRed:0.3 green:0.3 blue:1.0 alpha:0.8];
	CPTGradient *areaGradient1 = [CPTGradient gradientWithBeginningColor:areaColor1 endingColor:[CPTColor clearColor]];
	areaGradient1.angle			= -90.0f;
	areaGradientFill			= [CPTFill fillWithGradient:areaGradient1];
	boundLinePlot.areaFill		= areaGradientFill;
	boundLinePlot.areaBaseValue = [[NSDecimalNumber zero] decimalValue];
    
	// Add plot symbols
	CPTMutableLineStyle *symbolLineStyle = [CPTMutableLineStyle lineStyle];
	symbolLineStyle.lineColor = [CPTColor blackColor];
	CPTPlotSymbol *plotSymbol = [CPTPlotSymbol ellipsePlotSymbol];
	plotSymbol.fill			 = [CPTFill fillWithColor:[CPTColor blueColor]];
	plotSymbol.lineStyle	 = symbolLineStyle;
	plotSymbol.size			 = CGSizeMake(10.0, 10.0);
	boundLinePlot.plotSymbol = plotSymbol;
    
	// Add some initial data
	NSMutableArray *contentArray = [NSMutableArray arrayWithCapacity:100];
	NSUInteger i;
    
	for ( i = 0; i < 8; i++ ) {
        NSLog(@"XDDDDDDDDDDDDDD");
		id x = [NSNumber numberWithInt:-1*((i*15)+7)];
        NSLog(@"jijiji%@",x);
		id y = [NSNumber numberWithFloat:[[data objectAtIndex:i]floatValue]];
        //1.2 * rand() / (float)RAND_MAX + 1.2
		[contentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
	}
	self.dataForPlot = contentArray;
}
-(void)constructBarChart
{
	// Create barChart from theme
	barChart = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
	CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme];
	[barChart applyTheme:theme];
	barChartView.hostedGraph			 = barChart;
	barChart.plotAreaFrame.masksToBorder = NO;
    
	barChart.paddingLeft   = 70.0;
	barChart.paddingTop	   = 20.0;
	barChart.paddingRight  = 20.0;
	barChart.paddingBottom = 80.0;
    
	// Add plot space for horizontal bar charts
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)barChart.defaultPlotSpace;
	plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(300.0f)];
	plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(13.0f)];
    
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *)barChart.axisSet;
	CPTXYAxis *x		  = axisSet.xAxis;
	x.axisLineStyle				  = nil;
	x.majorTickLineStyle		  = nil;
	x.minorTickLineStyle		  = nil;
	x.majorIntervalLength		  = CPTDecimalFromString(@"5");
	x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	x.title						  = @"Month";
	x.titleLocation				  = CPTDecimalFromFloat(7.5f);
	x.titleOffset				  = 55.0f;
    
	// Define some custom labels for the data elements
	x.labelRotation	 = M_PI / 4;
	x.labelingPolicy = CPTAxisLabelingPolicyNone;
	NSArray *customTickLocations = [NSArray arrayWithObjects:[NSDecimalNumber numberWithInt:1], [NSDecimalNumber numberWithInt:2], [NSDecimalNumber numberWithInt:3], [NSDecimalNumber numberWithInt:4], [NSDecimalNumber numberWithInt:5], [NSDecimalNumber numberWithInt:6], [NSDecimalNumber numberWithInt:7], [NSDecimalNumber numberWithInt:8], [NSDecimalNumber numberWithInt:9], [NSDecimalNumber numberWithInt:10], [NSDecimalNumber numberWithInt:11], [NSDecimalNumber numberWithInt:12], nil];
	NSArray *xAxisLabels		 = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", nil];
	NSUInteger labelLocation	 = 0;
	NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
	for ( NSNumber *tickLocation in customTickLocations ) {
		CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[xAxisLabels objectAtIndex:labelLocation++] textStyle:x.labelTextStyle];
		newLabel.tickLocation = [tickLocation decimalValue];
		newLabel.offset		  = x.labelOffset + x.majorTickLength;
		newLabel.rotation	  = M_PI / 4;
		[customLabels addObject:newLabel];
        
	}
    
	x.axisLabels = [NSSet setWithArray:customLabels];
    
	CPTXYAxis *y = axisSet.yAxis;
	y.axisLineStyle				  = nil;
	y.majorTickLineStyle		  = nil;
	y.minorTickLineStyle		  = nil;
	y.majorIntervalLength		  = CPTDecimalFromString(@"50");
	y.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	y.title						  = @"The Electricity You Use";
	y.titleOffset				  = 45.0f;
	y.titleLocation				  = CPTDecimalFromFloat(150.0f);
    
	// First bar plot
	CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor greenColor] horizontalBars:NO];
	/*barPlot.baseValue  = CPTDecimalFromString(@"0");
     barPlot.dataSource = self;
     barPlot.barOffset  = CPTDecimalFromFloat(-0.25f);
     barPlot.identifier = @"Bar Plot 1";
     [barChart addPlot:barPlot toPlotSpace:plotSpace];*/
    
	// Second bar plot
	/*barPlot					= [CPTBarPlot tubularBarPlotWithColor:[CPTColor whiteColor] horizontalBars:NO];*/
	barPlot.dataSource		= self;
	barPlot.baseValue		= CPTDecimalFromString(@"0");
	barPlot.barOffset		= CPTDecimalFromFloat(0.25f);
	barPlot.barCornerRadius = 2.0f;
	barPlot.identifier		= @"Bar Plot 2";
	barPlot.delegate		= self;
	[barChart addPlot:barPlot toPlotSpace:plotSpace];
}


#pragma mark -
#pragma mark CPTBarPlot delegate method

-(void)barPlot:(CPTBarPlot *)plot barWasSelectedAtRecordIndex:(NSUInteger)index
{
    indexbar=index;
    
    [self performSegueWithIdentifier: @"segue1" sender:self];
	NSLog(@"barWasSelectedAtRecordIndex %d", index);
}


#pragma mark -
#pragma mark Plot Data Source Methods

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
	if ( [plot isKindOfClass:[CPTPieChart class]] ) {
		return [self.dataForChart count];
	}
	else if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
		return 16;
	}
	else {
		return [dataForPlot count];
	}
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
	NSDecimalNumber *num = nil;
    int temp[13]={200,265,295,189,251,236,259,230,215,268,285,296,244};
	if ( [plot isKindOfClass:[CPTPieChart class]] ) {
		if ( index >= [self.dataForChart count] ) {
			return nil;
		}
        
		if ( fieldEnum == CPTPieChartFieldSliceWidth ) {
			num = [self.dataForChart objectAtIndex:index];
		}
		else {
			num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
		}
	}
	else if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
		switch ( fieldEnum ) {
			case CPTBarPlotFieldBarLocation:
				if ( index == 0 ) {
					num = [NSDecimalNumber notANumber];
				}
				else {
					num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
				}
				break;
                
			case CPTBarPlotFieldBarTip:
				if ( index >=14  ) {
					num = [NSDecimalNumber notANumber];
				}
				else {
					num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:temp[index]];
					if ( [plot.identifier isEqual:@"Bar Plot 2"] ) {
						num = [num decimalNumberBySubtracting:[NSDecimalNumber decimalNumberWithString:@"10"]];
					}
				}
				break;
		}
	}
	else {
		if ( index % 8 ) {
			NSString *key = (fieldEnum == CPTScatterPlotFieldX ? @"x" : @"y");
			num = [[dataForPlot objectAtIndex:index] valueForKey:key];
			// Green plot gets shifted above the blue
			if ( [(NSString *)plot.identifier isEqualToString:@"Green Plot"] ) {
				if ( fieldEnum == CPTScatterPlotFieldY ) {
					num = (NSDecimalNumber *)[NSDecimalNumber numberWithDouble:[num doubleValue] + 1.0];
				}
			}
		}
		else {
			num = [NSDecimalNumber notANumber];
		}
	}
    
	return num;
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index
{
	if ( piePlotIsRotating ) {
		return nil;
	}
    
	static CPTMutableTextStyle *whiteText = nil;
    
	if ( !whiteText ) {
		whiteText		= [[CPTMutableTextStyle alloc] init];
		whiteText.color = [CPTColor whiteColor];
	}
    
	CPTTextLayer *newLayer = nil;
    
	if ( [plot isKindOfClass:[CPTPieChart class]] ) {
		switch ( index ) {
			case 0:
				newLayer = (id)[NSNull null];
				break;
                
			default:
				newLayer = [[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%lu", index] style:whiteText];
				break;
		}
	}
	else if ( [plot isKindOfClass:[CPTScatterPlot class]] ) {
		newLayer = [[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%lu", index] style:whiteText];
	}
    
	return newLayer;
}
-(void)setSes:(NSString*)ses UIP:(NSString *)up
{
    UIP=up;
    session=ses;
    NSLog(@"OKKK");
}

/*-(BOOL)plotSpace:(CPTPlotSpace *)space
 shouldHandlePointingDeviceDownEvent:(id)event atPoint:(CGPoint)point
 {
 
 NSLog(@"touched at: x: %f y: %f", point.x, point.y);
 return YES;
 }*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segue1"]) {
        
        // Get destination view
        ViewControllerPieChart *vc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        
        [vc monthSelect:indexbar];
        ///  [self dismissModalViewControllerAnimated:YES];
    }
}


@end
