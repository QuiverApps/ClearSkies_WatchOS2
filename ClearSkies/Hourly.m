//
//  Hourly.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "Hourly.h"

@implementation Hourly
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"hourlyData":@"data"
             };
}


+ (NSValueTransformer *)hourlyDataJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[HourlyData class]];
}

@end
