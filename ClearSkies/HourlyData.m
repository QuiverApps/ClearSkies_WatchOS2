//
//  HourlyData.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "HourlyData.h"

@implementation HourlyData

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        _time = [aDecoder decodeObjectForKey:@"time"];
        _icon = [aDecoder decodeObjectForKey:@"icon"];
        _temperature = [aDecoder decodeObjectForKey:@"temperature"];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.temperature forKey:@"temperature"];
}


+ (HourlyData *)buildFromJSONDictionary:(NSDictionary *)json {
    HourlyData *hourlyData = [[HourlyData alloc] init];
    hourlyData.time = [NSNumber numberWithDouble:[json[@"time"] doubleValue]];
    hourlyData.icon = json[@"icon"];
    hourlyData.temperature = [NSNumber numberWithDouble:[json[@"temperature"] doubleValue]];
    return hourlyData;
}
@end
