//
//  ViewController.m
//  ChartsDemo
//
//  Created by Yuanhai on 29/3/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//

#import "ViewController.h"
#import "DateValueFormatter.h"
#import "ChartsDemo-Swift.h"
@import Charts;

@interface ViewController ()

@property (nonatomic, strong) IBOutlet LineChartView *lineChart;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 基本设置，不允许操作
    self.lineChart.drawGridBackgroundEnabled = NO;
    self.lineChart.chartDescription.enabled = NO;
    self.lineChart.dragEnabled = NO;
    [self.lineChart setScaleEnabled:NO];
    self.lineChart.pinchZoomEnabled = YES;
    self.lineChart.drawGridBackgroundEnabled = NO;
    self.lineChart.noDataText = @"没有数据";
    self.lineChart.noDataFont = [UIFont systemFontOfSize:14];

    // 显示边界
    self.lineChart.drawBordersEnabled = YES;

    // X轴设置
    self.lineChart.xAxis.labelPosition = XAxisLabelPositionBottom;
    self.lineChart.xAxis.labelCount = 7;
    self.lineChart.xAxis.valueFormatter = [[DateValueFormatter alloc] init];
    
    // 设置最大与最小值
    [self setYAxisCount:6 max:60.0f min:-40.0f];
    
    // 启动定时器刷新图表
    [self setDataCount:8 range:50];
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self setDataCount:8 range:50];
    }];
}

// 左右线设置一样
- (void)setYAxisCount:(NSInteger)count max:(float)max min:(float)min
{
    self.lineChart.leftAxis.axisMinimum = min;
    self.lineChart.leftAxis.axisMaximum = max;
    self.lineChart.leftAxis.labelCount = count;
    
    self.lineChart.rightAxis.axisMinimum = min;
    self.lineChart.rightAxis.axisMaximum = max;
    self.lineChart.rightAxis.labelCount = count;
}

- (void)setDataCount:(int)count range:(double)range
{
    // 测试数据，传入n个，取值range的随机数
    NSMutableArray *values = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++)
    {
        double val = arc4random_uniform(range);
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:val icon:nil]];
    }
    
    LineChartDataSet *set1 = nil;
    if (self.lineChart.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)self.lineChart.data.dataSets[0];
        [set1 clear];
        
        // 刷新数据，replace函数如果能使用可代替
        for (ChartDataEntry *entry in values)
        {
            BOOL success = [set1 addEntry:entry];
            if (!success) break;
        }
        
        [self.lineChart.data notifyDataChanged];
        [self.lineChart notifyDataSetChanged];
    }
    else
    {
        // 初始化，设置标签、数据点
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@"My Data"];
        
        // 设置一些简单属性：折线模式、是否显示纵坐标值、是否显示小圆点
        set1.mode = LineChartModeCubicBezier;
        set1.drawValuesEnabled = YES;
        set1.drawCirclesEnabled = YES;
        
        // 圆点、折线颜色宽度等
        [set1 setColor:UIColor.greenColor];
        [set1 setCircleColor:UIColor.whiteColor];
        set1.lineWidth = 1.0;
        set1.circleRadius = 1.0;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        
        // 折线下方颜色
        NSArray *gradientColors = @[(id)[UIColor cyanColor].CGColor, (id)[UIColor redColor].CGColor];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 0.6;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = YES;
        CGGradientRelease(gradient);
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:@[set1]];
        self.lineChart.data = data;
    }
}

@end
