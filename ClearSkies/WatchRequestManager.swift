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
        
        //37.8267,-122.423
        GetForecastForLocation.doApiCall(37.8267, longitude: -122.423, success: { (weatherDataResponse:WeatherDataResponse) -> Void in
            reply(["response":NSKeyedArchiver.archivedDataWithRootObject(weatherDataResponse)])
            }, failure: { () -> Void in
                
        })
    }
}
