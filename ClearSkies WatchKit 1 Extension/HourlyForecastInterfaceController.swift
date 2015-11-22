//
//  HourlyForecastInterfaceController.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import WatchKit
import Foundation

class HourlyForecastInterfaceController: WKInterfaceController {
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var hourlyData: NSArray!
    var timeZone: NSString!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let weatherData = context as! WeatherDataResponse
        self.hourlyData = weatherData.hourly.hourlyData
        self.timeZone = weatherData.timezone
        
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.setNumberOfRows(24, withRowType: "HourForecastTableRow")
        
        for (var i = 0; i < 24; i++) {
            let row = tableView.rowControllerAtIndex(i) as! HourForecastTableRow
            let data = self.hourlyData[i] as! HourlyData
            
            let temperature = round(data.temperature!.doubleValue)
            let temperatureValue = String(format: "%.0f℉", arguments: [temperature])
            row.forecastTemperature.setText(temperatureValue)
            
            row.weatherTypeImage.setImage(ImageUtils.tintIconImage(data.icon))
            
            let date = NSDate(timeIntervalSince1970: data.time!.doubleValue)
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeZone = NSTimeZone(name: self.timeZone as String)
            dateFormatter.dateFormat = "hh a"
            row.forecastTime.setText(dateFormatter.stringFromDate(date))
        }
    }
}
