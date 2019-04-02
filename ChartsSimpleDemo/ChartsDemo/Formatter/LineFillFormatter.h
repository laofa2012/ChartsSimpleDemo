//
//  LineFillFormatter.h
//  ChartsDemo
//
//  Created by Yuanhai on 3/4/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartsDemo-Swift.h"
@import Charts;

@interface LineFillFormatter : NSObject <IChartFillFormatter>

- (id)initWithMinValue:(float)minValue;

@end
