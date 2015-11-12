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
    @IBOutlet weak var weatherTypeImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
        
        self.loadingGroup.setHidden(false)
        self.contentGroup.setHidden(true)
        self.errorLocationGroup.setHidden(true)
        self.errorServiceGroup.setHidden(true)
        
        InterfaceController.openParentApplication(["request":"request"]) { (reply:[NSObject : AnyObject], error:NSError?) -> Void in
            self.loadingGroup.setHidden(true)

            let response = NSKeyedUnarchiver.unarchiveObjectWithData(reply["response"] as! NSData)
            
            if(response!.isKindOfClass(NSError)) {
                let error = response as! NSError
                let errorType = error.localizedDescription
                
                if(errorType == Constants.WATCH_FAILURE_LOCATION) {
                    self.errorLocationGroup.setHidden(false)
                } else {
                    self.errorServiceGroup.setHidden(false)
                }
                
            } else {
                let weatherResponse = response as! WeatherDataResponse
                let weatherIcon:UIImage = UIImage(named: weatherResponse.currently.icon)!
                self.weatherTypeImage.setImage(weatherIcon)
                self.temperatureValueLabel.setText(weatherResponse.currently.apparentTemperature.stringValue)
                
                self.contentGroup.setHidden(false)
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
