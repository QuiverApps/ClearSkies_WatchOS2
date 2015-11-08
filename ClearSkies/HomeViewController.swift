//
//  HomeViewController.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/8/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager:CLLocationManager!
    var currentLocation:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        self.locationManager = nil
    }

}
