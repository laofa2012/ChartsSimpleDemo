//
//  DateValueFormatter.m
//  ChartsDemo
//
//  Created by Yuanhai on 29/3/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//


#import "DateValueFormatter.h"

@interface DateValueFormatter ()
{
    NSDateFormatter *_dateFormatter;
}
@end

@implementation DateValueFormatter

- (id)init
{
    self = [super init];
    if (self)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"mm:ss";
    }
    return self;
}

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    return [_dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:value]];
}

@end
