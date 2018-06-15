//
//  Configuration.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import Foundation

struct Defaults {

    //static let Latitude: Double = 51.400592
    //static let Longitude: Double = 4.760970

    // MARK: Derek Changed Default Location (College Station)
    static let Latitude: Double = 30.6280
    static let Longitude: Double = 93.3344
    
}

struct API {

    static let APIKey = "f8bced1cd82310d96e6b8c5519c59cd4"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!

    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
    
}
