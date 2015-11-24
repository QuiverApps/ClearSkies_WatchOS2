//
//  GetForecastForLocation.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/8/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import UIKit
import Alamofire

public class GetForecastForLocation: NSObject {
    
    public static func doApiCall(latitude:Double, longitude:Double, success:(WeatherDataResponse) -> Void, failure:() -> Void) {
        let apiKey = APIKeys.FORCAST_IO_KEY
        let address = String(format: "https://api.forecast.io/forecast/%@/%f,%f", arguments: [apiKey, latitude, longitude])
        
        Alamofire.request(.GET, address)
            .responseJSON { response in
                
            var weatherResponse:WeatherDataResponse = WeatherDataResponse()

            if(response.result.isSuccess) {
                if let JSON = response.result.value {
                    weatherResponse = WeatherDataResponse.buildFromJSONDictionary(JSON as! [NSObject : AnyObject])
                    weatherResponse.latitude = latitude;
                    weatherResponse.longitude = longitude;
                    success(weatherResponse)
                }
            } else {
                failure()
            }
        }
    }
}
