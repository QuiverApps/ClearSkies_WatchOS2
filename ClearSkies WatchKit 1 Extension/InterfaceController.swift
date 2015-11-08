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

    @IBOutlet weak var temperatureValueLabel: WKInterfaceLabel!
    @IBOutlet weak var weatherTypeImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        InterfaceController.openParentApplication(["request":"request"]) { (reply:[NSObject : AnyObject], error:NSError?) -> Void in
            let response = NSKeyedUnarchiver.unarchiveObjectWithData(reply["response"] as! NSData) as! WeatherDataResponse
            
            
            let weatherIcon:UIImage = UIImage(named: response.currently.icon)!
            self.weatherTypeImage.setImage(weatherIcon)
            self.temperatureValueLabel.setText(response.currently.apparentTemperature.stringValue)
            
            self.loadingGroup.setHidden(true)
            self.contentGroup.setHidden(false)
        }
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
