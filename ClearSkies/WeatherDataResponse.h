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
#import <Mantle/Mantle.h>


@interface WeatherDataResponse : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) CurrentWeather *currently;
@property (nonatomic, strong) Minutely *minutely;
@end
