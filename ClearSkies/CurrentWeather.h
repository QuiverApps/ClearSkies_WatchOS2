//
//  CurrentWeather.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CurrentWeather : NSObject <NSCoding>
@property (nonatomic, strong) NSNumber *apparentTemperature;
@property (nonatomic, strong) NSString *icon;

+ (CurrentWeather *)buildFromJSONDictionary:(NSDictionary *)json;
@end
