//
//  WeatherDataResponse.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentWeather.h"
#import "Minutely.h"
#import "Hourly.h"

@interface WeatherDataResponse : NSObject
@property (nonatomic, strong) CurrentWeather *currently;
@property (nonatomic, strong) Minutely *minutely;
@property (nonatomic, assign) double latitude, longitude;
@property (nonatomic, strong) Hourly *hourly;
@property (nonatomic, strong) NSString *timezone;


+ (WeatherDataResponse *)buildFromJSONDictionary:(NSDictionary *)json;
@end
