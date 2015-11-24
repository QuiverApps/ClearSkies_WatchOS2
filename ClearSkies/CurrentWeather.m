//
//  CurrentWeather.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "CurrentWeather.h"

@implementation CurrentWeather
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        _apparentTemperature = [aDecoder decodeObjectForKey:@"apparentTemperature"];
        _icon = [aDecoder decodeObjectForKey:@"icon"];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.apparentTemperature forKey:@"apparentTemperature"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
}


+ (CurrentWeather *)buildFromJSONDictionary:(NSDictionary *)json {
    CurrentWeather *currentWeather = [[CurrentWeather alloc] init];
    currentWeather.apparentTemperature = [NSNumber numberWithDouble:[json[@"apparentTemperature"] doubleValue]];
    currentWeather.icon = json[@"icon"];
    return currentWeather;
}

@end
