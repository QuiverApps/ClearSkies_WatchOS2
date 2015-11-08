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
import CoreLocation

public class WatchRequestManager: NSObject,CLLocationManagerDelegate {
    static let sharedInstance = WatchRequestManager()
    var locationManager:CLLocationManager!
    var currentLocation:CLLocationCoordinate2D!
    var responseHandler:(([NSObject : AnyObject]?) -> Void)!
    
    public func handleRequest(request:[NSObject : AnyObject]?, reply: ([NSObject : AnyObject]?) -> Void) {
        
        self.responseHandler = reply
        
        if let _ = self.currentLocation {
            getForecast()
        } else {
            self.locationManager = CLLocationManager()
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func getForecast() {
        GetForecastForLocation.doApiCall(self.currentLocation.latitude, longitude: self.currentLocation.longitude, success: { (weatherDataResponse:WeatherDataResponse) -> Void in
            self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(weatherDataResponse)])
            }, failure: { () -> Void in
                
        })
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        self.locationManager = nil
        self.currentLocation = locations[0].coordinate
        
        getForecast()
    }
}
