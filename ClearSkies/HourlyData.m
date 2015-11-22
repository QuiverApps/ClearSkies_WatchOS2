//
//  HourlyData.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "HourlyData.h"

@implementation HourlyData
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"time":@"time",
             @"icon":@"icon",
             @"temperature":@"temperature"
             };
}
@end
