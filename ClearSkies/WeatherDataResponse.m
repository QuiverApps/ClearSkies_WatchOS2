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
    
    WeatherDataResponse *weatherData = [[WeatherDataResponse alloc] init];
    
    weatherData.currently = [CurrentWeather buildFromJSONDictionary:json[@"currently"]];
    weatherData.minutely = [Minutely buildFromJSONDictionary:json[@"minutely"]];
    weatherData.hourly = [Hourly buildFromJSONArray:json[@"hourly"]];
    weatherData.timezone = json[@"timezone"];

    return weatherData;
}
@end
