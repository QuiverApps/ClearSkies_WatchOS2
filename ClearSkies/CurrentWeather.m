//
//  CurrentWeather.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "CurrentWeather.h"

@implementation CurrentWeather
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"apparentTemperature":@"apparentTemperature",
             @"icon":@"icon"
             };
}
@end
