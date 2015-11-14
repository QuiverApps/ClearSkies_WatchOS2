//
//  WeatherDataResponse.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "WeatherDataResponse.h"

@implementation WeatherDataResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"currently":@"currently",
             @"minutely":@"minutely"
             };
}


+ (NSValueTransformer *)currentlyJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[CurrentWeather class]];
}

+ (NSValueTransformer *)minutelyJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Minutely class]];
}

@end
