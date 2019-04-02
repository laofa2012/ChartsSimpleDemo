//
//  LineFillFormatter.m
//  ChartsDemo
//
//  Created by Yuanhai on 3/4/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//

#import "LineFillFormatter.h"

@interface LineFillFormatter ()

@property (nonatomic, assign) float minValue;

@end

@implementation LineFillFormatter

- (id)initWithMinValue:(float)minValue
{
    self = [super init];
    if (self)
    {
        self.minValue = minValue;
    }
    
    return self;
}

- (CGFloat)getFillLinePositionWithDataSet:(LineChartDataSet *)dataSet dataProvider:(id<LineChartDataProvider>)dataProvider
{
    return self.minValue;
}

@end
