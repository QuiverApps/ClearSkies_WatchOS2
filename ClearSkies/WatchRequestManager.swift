//
//  WatchRequestManager.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/7/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import UIKit
import Alamofire

public class WatchRequestManager: NSObject {
    static let sharedInstance = WatchRequestManager()
    
    public func handleRequest(request:[NSObject : AnyObject]?, reply: ([NSObject : AnyObject]?) -> Void) {
        
        
        let address = "https://api.forecast.io/forecast/bb69be65daef3de846ed82fe78f798da/37.8267,-122.423"
        
        Alamofire.request(.GET, address, parameters: ["foo": "bar"])
            .responseJSON { response in
                
                reply(["response":response.result.value!])
                
        }
        
    }
}
