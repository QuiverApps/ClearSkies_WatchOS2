//
//  HourForecastTableRow.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import WatchKit

class HourForecastTableRow: NSObject {
    @IBOutlet weak var forecastTemperature: WKInterfaceLabel!
    @IBOutlet weak var forecastTime: WKInterfaceLabel!
    @IBOutlet weak var weatherTypeImage: WKInterfaceImage!
}
