//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by Derek on 6/15/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

struct DayViewViewModel {
    
    // MARK: - Properties
    
    let weatherData: WeatherData
 
    var date: String {
        // Initialize Date Formatter
        let dateFormatter = DateFormatter()
        
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d"
        
        return dateFormatter.string(from: weatherData.time)
    }
    
    var time: String {
        // Initialize Date Formatter
        let dateFormatter = DateFormatter()
        
        // Configure Date Formatter
        dateFormatter.dateFormat = ""
        
        return dateFormatter.string(from: weatherData.time)
    }
    
}
