//
//  CurrentWeather.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CurrentWeather : NSObject
@property (nonatomic, strong) NSNumber *apparentTemperature;
@property (nonatomic, strong) NSString *icon;
@end
