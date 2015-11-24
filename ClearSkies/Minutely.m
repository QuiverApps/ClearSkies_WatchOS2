//
//  Minutely.m
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/13/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import "Minutely.h"

@implementation Minutely

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        _summary = [aDecoder decodeObjectForKey:@"summary"];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.summary forKey:@"summary"];
}

+ (Minutely *)buildFromJSONDictionary:(NSDictionary *)json {
    Minutely *minutely = [[Minutely alloc] init];
    minutely.summary = json[@"summary"];
    return minutely;
}
@end
