//
//  Minutely.h
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/13/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Minutely : NSObject <NSCoding>
@property (nonatomic, strong) NSString *summary;

+ (Minutely *)buildFromJSONDictionary:(NSDictionary *)json;
@end
