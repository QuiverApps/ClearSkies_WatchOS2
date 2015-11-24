//
//  Hourly.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "Hourly.h"

@implementation Hourly

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        _hourlyData = [aDecoder decodeObjectForKey:@"hourlyData"];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.hourlyData forKey:@"hourlyData"];
}

+ (Hourly *)buildFromJSONDictionary:(NSDictionary *)json {
    Hourly *hourly = [[Hourly alloc] init];
    
    NSMutableArray *hourlyDataArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *data in json[@"data"]) {
        HourlyData *hourlyData = [HourlyData buildFromJSONDictionary:data];
        [hourlyDataArray addObject:hourlyData];
    }
    
    hourly.hourlyData = hourlyDataArray;
    
    return hourly;
}
@end
