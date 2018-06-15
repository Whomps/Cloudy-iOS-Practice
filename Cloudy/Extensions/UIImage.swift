//
//  UIImage.swift
//  Cloudy
//
//  Created by Derek on 6/15/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

// This extension was NOT created in the view models because the logic within
//   may be applied to both day views and week views

import UIKit

extension UIImage {
    
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day", "clear-night", "rain", "snow", "sleet": return UIImage(named: name)
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night": return UIImage(named: "cloudy")
        default: return UIImage(named: "clear-day")
        }
    }
    
}

