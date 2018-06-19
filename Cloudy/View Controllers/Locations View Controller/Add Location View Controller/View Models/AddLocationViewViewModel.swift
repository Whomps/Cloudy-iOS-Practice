//
//  AddLocationViewViewModel.swift
//  Cloudy
//
//  Created by Derek on 6/18/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class AddLocationViewViewModel {
    
    // MARK: Initialization
    
    init(query: Driver<String>, locationService: LocationService) {
        // Set Properties
        self.locationService = locationService
        
        query
            .throttle(0.5)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (addressString) in
                self?.geocode(addressString: addressString)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: -
    
    private let disposeBag = DisposeBag()
    
    private let _locations = BehaviorRelay<[Location]>(value: [])
    
    private let _querying = BehaviorRelay<Bool>(value: false)
    
    // MARK: -

    var querying: Driver<Bool> { return _querying.asDriver() }
    
    var locations: Driver<[Location]> { return _locations.asDriver() }
    
    // MARK: -
    
    var hasLocations: Bool { return numberOfLocations > 0 }
    
    var numberOfLocations: Int { return _locations.value.count }
    
    // MARK: -
    
    private let locationService: LocationService
 
    func location(at index: Int) -> Location? {
        guard index < _locations.value.count else { return nil }
        return _locations.value[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = location(at: index) else { return nil }
        return LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
    }
    
    // MARK: - Helper Methods
    
    private func geocode(addressString: String?) {
        guard let addressString = addressString, addressString.count > 2 else {
            _locations.accept([])
            return
        }
    
        _querying.accept(true)
    
        // Geocode Address String
        locationService.geocode(addressString: addressString) { [weak self] (locations, error) in
            self?._querying.accept(false)
            self?._locations.accept(locations)
            
            if let error = error {
                print("Unable to Forward Geocode Address (\(error))")
            }
        }
    }
    
}

