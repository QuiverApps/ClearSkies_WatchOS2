//
//  InterfaceController.swift
//  ClearSkies WatchKit 1 Extension
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var loadingGroup: WKInterfaceGroup!
    @IBOutlet weak var contentGroup: WKInterfaceGroup!
    @IBOutlet weak var errorLocationGroup: WKInterfaceGroup!
    @IBOutlet weak var errorServiceGroup: WKInterfaceGroup!

    @IBOutlet weak var temperatureValueLabel: WKInterfaceLabel!
    @IBOutlet weak var forecastSummary: WKInterfaceLabel!
    @IBOutlet weak var weatherTypeImage: WKInterfaceImage!
    
    var currentLocation:CLLocationCoordinate2D!
    var weatherData:WeatherDataResponse!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loadWeatherData()
    }

    override func willActivate() {
        super.willActivate()
    }
    
    func getCurrentLocation() {
        self.clearAllMenuItems()
        
        WatchRequestManager.sharedInstance.handleRequest(["action":Constants.WATCH_ACTION_GET_LOCATION]) { (reply:[NSObject : AnyObject]?) -> Void in
            self.loadingGroup.setHidden(true)
            
            let response = NSKeyedUnarchiver.unarchiveObjectWithData(reply["response"] as! NSData)
            self.handleResponse(response)
        }
    }
    
    func getForecast(coordinate:CLLocationCoordinate2D) {
        self.clearAllMenuItems()

        let requestObject = ["action":Constants.WATCH_ACTION_GET_FORECAST,
            "latitude": NSNumber(double: coordinate.latitude),
            "longitude": NSNumber(double: coordinate.longitude)]
        
        WatchRequestManager.sharedInstance.handleRequest(requestObject) { (reply:[NSObject : AnyObject]?) -> Void in
            self.loadingGroup.setHidden(true)
            
            let response = NSKeyedUnarchiver.unarchiveObjectWithData(reply["response"] as! NSData)
            self.handleResponse(response)
        }
    }
    
    func handleResponse(response:AnyObject?) {
        self.addMenuItemWithItemIcon(WKMenuItemIcon.Resume, title: "Refresh", action: Selector("loadWeatherData"))

        if(response!.isKindOfClass(NSError)) {
            let error = response as! NSError
            let errorType = error.localizedDescription
            
            if(errorType == Constants.WATCH_FAILURE_LOCATION) {
                self.errorLocationGroup.setHidden(false)
            } else {
                self.errorServiceGroup.setHidden(false)
            }
            
        } else {
            self.addMenuItemWithItemIcon(WKMenuItemIcon.Info, title: "Forecast", action: Selector("goToHourlyForecast"))

            let weatherResponse = response as! WeatherDataResponse
            self.weatherData = weatherResponse;
            
            self.weatherTypeImage.setImage(ImageUtils.tintIconImage(weatherResponse.currently.icon))
            
            let temperature = round(weatherResponse.currently.apparentTemperature.doubleValue)
            let temperatureValue = String(format: "%.0f℉", arguments: [temperature])
            self.temperatureValueLabel.setText(temperatureValue)
            self.currentLocation = CLLocationCoordinate2DMake(weatherResponse.latitude, weatherResponse.longitude)
            
            self.forecastSummary.setText(weatherResponse.minutely.summary)
            
            self.contentGroup.setHidden(false)
        }
    }
    
    func loadWeatherData() {
        self.loadingGroup.setHidden(false)
        self.contentGroup.setHidden(true)
        self.errorLocationGroup.setHidden(true)
        self.errorServiceGroup.setHidden(true)
        
        if let _ = currentLocation {
            getForecast(currentLocation)
        } else {
            getCurrentLocation()
        }
    }
    
    func goToHourlyForecast() {
        self.pushControllerWithName("HourlyForecastInterfaceController", context: self.weatherData)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
