//
//  HourlyData.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HourlyData : NSObject <NSCoding>
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSNumber *temperature;

+ (HourlyData *)buildFromJSONDictionary:(NSDictionary *)json;
@end
