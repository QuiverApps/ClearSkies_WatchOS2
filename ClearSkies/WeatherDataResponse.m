//
//  WeatherDataResponse.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "WeatherDataResponse.h"

@implementation WeatherDataResponse

+ (WeatherDataResponse *)buildFromJSONDictionary:(NSDictionary *)json {
    
    return [[WeatherDataResponse alloc] init];
}
@end
