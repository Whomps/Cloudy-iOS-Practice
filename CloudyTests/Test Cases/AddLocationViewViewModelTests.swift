//
//  AddLocationViewViewModelTests.swift
//  CloudyTests
//
//  Created by Derek on 6/19/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
import RxBlocking

@testable import Cloudy

class AddLocationViewViewModelTests: XCTestCase {
    
    private class MockLocationService: LocationService {
        func geocode(addressString: String?, completionHandler: @escaping LocationService.LocationServiceCompletionHandler) {
            if let addressString = addressString, !addressString.isEmpty {
                // Create Location
                let location = Location(name: "Brussels", latitude: 50.8503, longitude: 4.3517)
                
                // Invoke Completion Handler
                completionHandler([location], nil)
            } else {
                // Invoke Completion Handler
                completionHandler([], nil)
            }
        }
        
    }
    
    override func setUp() {
        super.setUp()
        
        // Initialize Query
        query = BehaviorRelay<String>(value: "")
        
        // Initialize Location Service
        let locationService = MockLocationService()
        
        // Initialize View Model
        viewModel = AddLocationViewViewModel(query: query.asDriver(), locationService: locationService)
        
        // Initialize Scheduler
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Properties
    
    var viewModel: AddLocationViewViewModel!
    
    // MARK: -
    
    // Schedulers provide a layer of abstraction for scheduling operations using RxSwift
    var scheduler:SchedulerType!
    
    // MARK: -
    
    var query: BehaviorRelay<String>!
    
    // MARK: - Tests for Locations
    
    func testLocations_HasLocation() {
        // Create Subscription
        let observable = viewModel.locations.asObservable().subscribeOn(scheduler)
        
        // Set Query (this mimics the user entering a name of a city in the search bar)
        query.accept("Brus")
        
        // Fetch Result (we use toBlocking() to make the test synchronous)
        let result = try! observable.skip(1).toBlocking().first()!
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 1)
        
        // Fetch Location
        let location = result.first!
        
        XCTAssertEqual(location.name, "Brussels")
    }
    
    func testLocations_NoLocations() {
        //Create Subscription
        let observable = viewModel.locations.asObservable().subscribeOn(scheduler)
        
        // Fetch Results
        let result: [Location] = try! observable.toBlocking().first()!
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 0)
    }
    
    func testLocationsAtIndex_NonNil() {
        // Create Subscription
        let observable = viewModel.locations.asObservable().subscribeOn(scheduler)
        
        // Set Query
        query.accept("Brus")
        
        // Fetch Results
        let _ = try! observable.skip(1).toBlocking().first()!
        
        // Fetch Location
        let result = viewModel.location(at: 0)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.name, "Brussels")
    }
    
    func testLocationsAtIndex_Nil() {
        // Create Subscription
        let observable = viewModel.locations.asObservable().subscribeOn(scheduler)
        
        // Set Query
        query.accept("Brus")
        
        // Fetch Results
        let _ = try! observable.skip(1).toBlocking().first()!
        
        // Fetch Location
        let result = viewModel.location(at: 1)
        
        XCTAssertNil(result)
    }
    
}
