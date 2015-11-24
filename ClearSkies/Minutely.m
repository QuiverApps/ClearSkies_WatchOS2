//
//  Minutely.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/13/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "Minutely.h"

@implementation Minutely

+ (Minutely *)buildFromJSONDictionary:(NSDictionary *)json {
    Minutely *minutely = [[Minutely alloc] init];
    minutely.summary = json[@"summary"];
    return minutely;
}
@end
