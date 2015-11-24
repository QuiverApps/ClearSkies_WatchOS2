//
//  ImageUtils.swift
//  ClearSkies
//
//  Created by Jeremy Roberts on 11/22/15.
//  Copyright © 2015 Jeremy Roberts. All rights reserved.
//

import Foundation
import WatchKit

public class ImageUtils: NSObject {
    
    public static func tintIconImage(imageName:String) -> UIImage{
        let color = UIColor(red: 249.0/255.0, green: 89.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        let image = UIImage(named: imageName)!
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        
        CGContextTranslateCTM(context, 0, image.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextClipToMask(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
        CGContextFillRect(context, CGRectMake(0, 0, image.size.width, image.size.height));
        
        let coloredImg = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return coloredImg
    }

}
