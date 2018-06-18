//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Derek on 6/18/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel {
    
    // MARK: - Properties
    
    let temperatureNotation: TemperatureNotation
    
    var text: String {
        switch temperatureNotation {
        case .fahrenheit: return "Fahrenheit"
        case .celsius: return "Celsius"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}

extension SettingsViewTemperatureViewModel: SettingsRepresentable  {
    
}
