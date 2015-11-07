//
//  WatchRequestManager.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import UIKit
import Alamofire
import Mantle

public class WatchRequestManager: NSObject {
    static let sharedInstance = WatchRequestManager()
    
    public func handleRequest(request:[NSObject : AnyObject]?, reply: ([NSObject : AnyObject]?) -> Void) {
        
        let apiKey = APIKeys.FORCAST_IO_KEY
        let address = String(format: "https://api.forecast.io/forecast/%@/37.8267,-122.423", arguments: [apiKey])
        
        Alamofire.request(.GET, address)
            .responseJSON { response in
                
                var weatherResponse:WeatherDataResponse = WeatherDataResponse()
                
                do {
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        weatherResponse = try MTLJSONAdapter.modelOfClass(WeatherDataResponse.self, fromJSONDictionary: JSON as! [NSObject : AnyObject]) as! WeatherDataResponse
                    }
                    
                    
                } catch {
                    NSLog("ERROR")
                }
                                
                reply(["response":NSKeyedArchiver.archivedDataWithRootObject(weatherResponse)])
                
        }
        
    }
}
