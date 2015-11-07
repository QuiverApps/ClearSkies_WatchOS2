//
//  CurrentWeather.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface CurrentWeather : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSNumber *apparentTemperature;
@property (nonatomic, strong) NSString *icon;
@end
