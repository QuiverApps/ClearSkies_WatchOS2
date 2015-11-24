//
//  HourlyData.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "HourlyData.h"

@implementation HourlyData
+ (HourlyData *)buildFromJSONDictionary:(NSDictionary *)json {
    HourlyData *hourlyData = [[HourlyData alloc] init];
    hourlyData.time = [NSNumber numberWithDouble:[json[@"time"] doubleValue]];
    hourlyData.icon = json[@"icon"];
    hourlyData.temperature = [NSNumber numberWithDouble:[json[@"temperature"] doubleValue]];
    return hourlyData;
}
@end
