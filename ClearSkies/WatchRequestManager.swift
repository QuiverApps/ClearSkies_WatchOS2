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
        
        if let requestDictionary = request {
            let action:String = requestDictionary["action"] as! String
            if(action == Constants.WATCH_ACTION_GET_LOCATION) {
                let authorizationStatus = CLLocationManager.authorizationStatus()
                if(authorizationStatus == CLAuthorizationStatus.Denied || authorizationStatus == CLAuthorizationStatus.Restricted) {
                    self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(buildErrorWithMessage(Constants.WATCH_FAILURE_LOCATION))])
                } else {
                    getCurrentLocation()
                }
            } else if(action == Constants.WATCH_ACTION_GET_FORECAST) {
                let latitude = requestDictionary["latitude"] as! NSNumber
                let longitude = requestDictionary["longitude"] as! NSNumber
                getForecast(latitude.doubleValue, longitude: longitude.doubleValue)
            } else {
                self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(buildErrorWithMessage(Constants.WATCH_FAILURE_NO_ACTION))])
            }
        } else {
            self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(buildErrorWithMessage(Constants.WATCH_FAILURE_NO_ACTION))])
        }
    }
    
    func getForecast(latitude:Double, longitude:Double) {
        GetForecastForLocation.doApiCall(latitude, longitude: longitude, success: { (weatherDataResponse:WeatherDataResponse) -> Void in
            self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(weatherDataResponse)])
            }, failure: { () -> Void in
                self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(self.buildErrorWithMessage(Constants.WATCH_FAILURE_SERVICE))])

        })
    }
    
    func getCurrentLocation() {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        self.locationManager = nil
        
        
        let location = locations[0]
        
        getForecast(location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.responseHandler(["response":NSKeyedArchiver.archivedDataWithRootObject(buildErrorWithMessage(Constants.WATCH_FAILURE_LOCATION))])
    }
    
    func buildErrorWithMessage(message:String) -> NSError {
        return NSError(domain: "ClearSkies", code: 0, userInfo: [NSLocalizedDescriptionKey:message])
    }
}
