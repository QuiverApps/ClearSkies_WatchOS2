//
//  Hourly.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HourlyData.h"

@interface Hourly : NSObject
@property (nonatomic, strong) NSArray *hourlyData;
+ (Hourly *)buildFromJSONArray:(NSArray *)json;
@end
