//
//  WeatherLocationManager.swift
//  Misty
//
//  Created by Gene Bogdanovich on 16.12.20.
//

import Foundation
import Combine
import CoreLocation

class WeatherLocationManager {
    let locationPublisher: AnyPublisher<[CLLocation], Never>
    let manager: CLLocationManager
    let publicist: CLLocationManagerCombineDelegate
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            let manager = CLLocationManager()
            
            manager.requestWhenInUseAuthorization()
            let publicist = CLLocationManagerPublicist()
            manager.delegate = publicist
            
            self.manager = manager
            self.publicist = publicist
            
            // Publishing location
            
            locationPublisher = publicist.locationPublisher()
                .handleEvents(receiveSubscription: { _ in
                    // Manually requesting location to update weather right away if settings change.
                    manager.requestLocation()
                })
                .eraseToAnyPublisher()
            
            // Publishing authorization
            
            let authorizationPublisher = publicist.authorizationPublisher()
            
            authorizationPublisher
                .sink(receiveValue: beginUpdates(_:))
                .store(in: &cancellables)
            
        } else {
            // TODO: Error handling!
            fatalError()
        }
    }
    
    /// This method will start updating location as soon as it receives authorizedAlways or authorizedWhenInUse CLAuthorizationStatus.
    func beginUpdates(_ authorizationStatus: CLAuthorizationStatus) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            
            if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
                // The device does not support this service.
                return
            }
            self.manager.startMonitoringSignificantLocationChanges()
        }
    }
}
