//
//  Hourly.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "Hourly.h"

@implementation Hourly

+ (Hourly *)buildFromJSONArray:(NSArray *)json {
    Hourly *hourly = [[Hourly alloc] init];
    
    NSMutableArray *hourlyDataArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *data in json) {
        HourlyData *hourlyData = [HourlyData buildFromJSONDictionary:data];
        [hourlyDataArray addObject:hourlyData];
    }
    
    hourly.hourlyData = hourlyDataArray;
    
    return hourly;
}
@end
