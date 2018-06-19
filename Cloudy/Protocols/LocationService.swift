//
//  LocationService.swift
//  Cloudy
//
//  Created by Derek on 6/19/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

// This is created as part of Episode 26.
// It serves to decouple the View Model from the Core Location framework.
// Its parts are not fully explained in the episode.
protocol LocationService {
    
    // "This is primarily for convenience"
    typealias LocationServiceCompletionHandler = ([Location], Error?) -> Void
    
    // "definition of the method that performs the geocoding request"
    // "Because the geocoding request is performed async, we mark the completion handler as escaping"
    func geocode(addressString: String?, completionHandler: @escaping LocationServiceCompletionHandler)

}

