//
//  WeatherDataResponse.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "WeatherDataResponse.h"

@implementation WeatherDataResponse

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        _currently = [aDecoder decodeObjectForKey:@"currently"];
        _minutely = [aDecoder decodeObjectForKey:@"minutely"];
        _hourly = [aDecoder decodeObjectForKey:@"hourly"];
        _timezone = [aDecoder decodeObjectForKey:@"timezone"];
        _latitude = [aDecoder decodeDoubleForKey:@"latitude"];
        _longitude = [aDecoder decodeDoubleForKey:@"longitude"];
    }
    return self;
        
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.currently forKey:@"currently"];
    [aCoder encodeObject:self.minutely forKey:@"minutely"];
    [aCoder encodeObject:self.hourly forKey:@"hourly"];
    [aCoder encodeObject:self.timezone forKey:@"timezone"];
    [aCoder encodeDouble:self.latitude forKey:@"latitude"];
    [aCoder encodeDouble:self.longitude forKey:@"longitude"];
}


+ (WeatherDataResponse *)buildFromJSONDictionary:(NSDictionary *)json {
    
    WeatherDataResponse *weatherData = [[WeatherDataResponse alloc] init];
    
    weatherData.currently = [CurrentWeather buildFromJSONDictionary:json[@"currently"]];
    weatherData.minutely = [Minutely buildFromJSONDictionary:json[@"minutely"]];
    weatherData.hourly = [Hourly buildFromJSONDictionary:json[@"hourly"]];
    weatherData.timezone = json[@"timezone"];

    return weatherData;
}
@end
