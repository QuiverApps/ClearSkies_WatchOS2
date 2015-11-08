//
//  GetForecastForLocation.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/8/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import UIKit
import Alamofire
import Mantle

public class GetForecastForLocation: NSObject {
    
    public static func doApiCall(latitude:Double, longitude:Double, success:(WeatherDataResponse) -> Void, failure:() -> Void) {
        let apiKey = APIKeys.FORCAST_IO_KEY
        let address = String(format: "https://api.forecast.io/forecast/%@/%f,%f", arguments: [apiKey, latitude, longitude])
        
        Alamofire.request(.GET, address)
            .responseJSON { response in
                
                var weatherResponse:WeatherDataResponse = WeatherDataResponse()
                
                do {
                    
                    if(response.result.isSuccess) {
                        if let JSON = response.result.value {
                            weatherResponse = try MTLJSONAdapter.modelOfClass(WeatherDataResponse.self, fromJSONDictionary: JSON as! [NSObject : AnyObject]) as! WeatherDataResponse
                            success(weatherResponse)
                        }
                    } else {
                        failure()
                    }
                } catch {
                    failure()
                }
                
                //reply(["response":NSKeyedArchiver.archivedDataWithRootObject(weatherResponse)])
                
        }
    }

}
