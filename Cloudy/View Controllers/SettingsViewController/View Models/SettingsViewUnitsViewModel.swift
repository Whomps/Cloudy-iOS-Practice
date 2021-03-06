//
//  SwiftViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Derek on 6/18/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {
    
    // MARK: - Properties
    
    let unitsNotation: UnitsNotation
    
    // MARK: - Public Interface
    
    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
        
    }
}

extension SettingsViewUnitsViewModel: SettingsRepresentable {
    
}
